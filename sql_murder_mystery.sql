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

-- Congrats, you found the murderer! 
-- But wait, there's more... If you think you're up for a challenge, 
-- try querying the interview transcript of the murderer to find the real villain behind this crime. 
-- If you feel especially confident in your SQL skills, 
-- try to complete this final step with no more than 2 queries. 


SELECT name, transcript
FROM person p
JOIN interview i
  ON p.id = i.person_id
WHERE name = 'Jeremy Bowers'

-- name	transcript
-- Jeremy Bowers	I was hired by a woman with a lot of money. 
-- I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. 
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.

SELECT name, height, hair_color, car_make, car_model, event_name, date
FROM person p
JOIN drivers_license d
  ON p.license_id = d.id
JOIN facebook_event_checkin f
  ON p.id = f.person_id
WHERE height BETWEEN 65 AND 67
AND hair_color = 'red'
AND car_make = 'Tesla'
AND car_model = 'Model S'
AND date LIKE '201712__'

-- name	height	hair_color	car_make	car_model	event_name	date
-- Miranda Priestly	66	red	Tesla	Model S	SQL Symphony Concert	20171206
-- Miranda Priestly	66	red	Tesla	Model S	SQL Symphony Concert	20171212
-- Miranda Priestly	66	red	Tesla	Model S	SQL Symphony Concert	20171229

-- Congrats, you found the brains behind the murder! 
-- Everyone in SQL City hails you as the greatest SQL detective of all time. 
-- Time to break out the champagne!