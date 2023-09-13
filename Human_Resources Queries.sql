-- 1 What is the gender of breakdown of employees in the company?
SELECT gender, count(*) AS count 
FROM human_resources
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY gender;

-- 2 What is the race/ethnicity breakdown of employees in the country?
SELECT race, count(*) AS count
FROM human_resources
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY race
ORDER BY count(*) DESC;

-- 3 What is the age distribution of employees in the company?
SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM human_resources
WHERE age >= 18 AND termdate = '0000-00-00';

SELECT count(*) AS Count, 
CASE
	WHEN age >= 18 AND age <= 24 THEN '18-24'
	WHEN age >= 25 AND age <= 34 THEN '25-34'
	WHEN age >= 35 AND age <= 44 THEN '35-44'
	WHEN age >= 45 AND age <= 54 THEN '45-54'
	WHEN age >= 55 AND age <= 64 THEN '55-64'
	ELSE '65+'
END AS age_group, gender
FROM human_resources
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY age_group, gender
ORDER BY age_group, gender;

-- 4 How many workers work at headquarters versus remote locations?
SELECT location, count(*) AS Count 
FROM human_resources
WHERE age >= 18 AND termdate = '0000-00-00'
GROUP BY location;

-- 5 What is the average length of employment for employees who have been terminated?
SELECT 
	round(avg(datediff(termdate, hire_date))/365, 0) AS avg_length_employment
FROM human_resources
WHERE termdate <= curdate() AND termdate <> '0000-00-00' AND age >= 18;
