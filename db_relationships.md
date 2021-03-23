### One-to-One Relationships

Address v1

| id |  city | postcode |
|---|---|---|
| 27 |London|SW1 1DB|
| 32 |Wisbech|PE13 2DB|


User v3

|      id | user_name | password | email       | address_id |
|---------|-----------|----------|-------------|----------|
|  1      | bob       | 1234     | bob@bob.com |  27 |
|  2      | tom       | 5678     | tom@tom.com |  32 |

Both tables are related using address_id
```
SELECT * FROM User INNER JOIN Address ON User.address_id = Address.id;
```
(INNER) JOIN - Displays users who have a matching address_id on both sides - INTERSECTION

### One-to-Many Relationships  

User v3

|      id | user_name | password | email       | address_id |
|---------|-----------|----------|-------------|----------|
|  1      | bob       | 1234     | bob@bob.com |  27 |
|  2      | tom       | 5678     | tom@tom.com |  32 |

Blogposts v1

|id | user_id | title | content |
|---|---|---|---|
|1 | 1 | my dog | my lovely dog |
|2 | 2 | trees | Lovely trees |
|3 | 2 | Prince | Yay Purple Rain|
|4 | 1 | my cat | my wonderful cat|
```
SELECT * FROM User LEFT JOIN Blog ON User.id = Blog.user_id;
```
(OUTER) LEFT JOIN - Displays all user data and any blog ids.
Would still show users if they don't have any blog posts.

### Many-to-Many Relationships

Blogposts v2

|id | user_id | title | content | tag1 | tag2|
|---|---|---|---|---|---|
|1 | 1 | my dog | my lovely dog | animals| |
|2 | 2 | trees | Lovely trees | gardening| |
|3 | 2 | Prince | Yay Purple Rain| diminutive pop-stars| |
|4 | 1 | my cat | my wonderful cat| animals| cats|

A post has many tags, and a tag has posts. A many-to-many relationship.

Not a good table as would have to have the number of tags amount of columns

TagsBlogposts

|blog_id|tag_id|
|---|---|
|4| 1|
|4| 2|
|1 |2|
|2 |3|
|3| 4|

This is better - linking each blog_id to a tag_id which can be referenced in the tables below.

Tags v2

|id | tag_name| 
|---|---|
|1 | cats |
|2 | animals|
|3 | gardening|
|4 | diminutive pop-stars|

Blogposts v1

|id | user_id | title | content |
|---|---|---|---|
|1 | 1 | my dog | my lovely dog |
|2 | 2 | trees | Lovely trees |
|3 | 2 | Prince | Yay Purple Rain|
|4 | 1 | my cat | my wonderful cat|

```
SELECT * FROM TagsBlogposts
INNER JOIN Tags ON Tags.id = TagsBlogposts.tag_id
INNER JOIN Blogposts ON Blogposts.id = TagsBlogposts.blog_id;
```

