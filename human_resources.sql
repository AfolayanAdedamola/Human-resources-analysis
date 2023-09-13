SELECT * FROM human_resources;
describe humanresources;

-- change the date format to ensure uniformity of the birthdate column
UPDATE human_resources
SET birthdate = CASE 
  WHEN birthdate LIKE'%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
  WHEN birthdate LIKE'%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
  ELSE NULL
END;

-- sets the birthdate column type to the date type
ALTER TABLE human_resources
MODIFY COLUMN birthdate DATE;

-- sets all the hire_date column values to the same format 
UPDATE human_resources
SET hire_date = CASE 
  WHEN hire_date LIKE'%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
  WHEN hire_date LIKE'%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
  ELSE NULL
END;

ALTER TABLE human_resources
MODIFY COLUMN hire_date DATE;

UPDATE human_resources
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'));

-- Adding an age column to the table
ALTER TABLE human_resources
ADD COLUMN age INT;

-- the line of code below calculates the age values for each worker and adds the values to the age column
UPDATE human_resources
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT 
	min(age) AS youngest,
	max(age) AS oldest
FROM human_resources;

SELECT count(*) FROM human_resources WHERE age < 18;

SELECT birthdate, age FROM human_resources 



