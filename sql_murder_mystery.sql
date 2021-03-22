SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC LIMIT 1
-- id	name	license_id	address_number	address_street_name	ssn
-- 14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949
SELECT * FROM person
WHERE address_street_name = 'Franklin Ave'
AND name LIKE 'Annabel%'
-- id	name	license_id	address_number	address_street_name	ssn
-- 16371	Annabel Miller	490173	103	Franklin Ave	318771143
SELECT name, transcript
FROM person p
JOIN Interview i
  ON i.person_id = p.id
WHERE name = 'Morty Schapiro'
  OR name = 'Annabel Miller'
name	transcript

-- Morty Schapiro	I heard a gunshot and then saw a man run out. 
-- He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". 
-- Only gold members have those bags. The man got into a car with a plate that included "H42W".
-- Annabel Miller	I saw the murder happen, and I recognized the killer 
-- from my gym when I was working out last week on January the 9th.

SELECT name, membership_id, check_in_date
FROM get_fit_now_check_in i
JOIN get_fit_now_member m
  ON i.membership_id = m.id
WHERE membership_id LIKE '48Z%'

-- name	membership_id	check_in_date	membership_status
-- Tomas Baisley	48Z38	20170611	silver
-- Tomas Baisley	48Z38	20171212	silver
-- Tomas Baisley	48Z38	20170820	silver
-- Tomas Baisley	48Z38	20180314	silver
-- Tomas Baisley	48Z38	20170120	silver
-- Joe Germuska	48Z7A	20180109	gold ---------> 9th Jan and gold
-- Jeremy Bowers	48Z55	20180109	gold ---------> 9th Jan and gold

SELECT name, plate_number
FROM person p
JOIN drivers_license d
  ON p.license_id = d.id
WHERE plate_number LIKE '%H42W%'

-- name	plate_number
-- Tushar Chandra	4H42WR
-- Jeremy Bowers	0H42W2
-- Maxine Whitely	H42W0X

-- Completed murder mystery!