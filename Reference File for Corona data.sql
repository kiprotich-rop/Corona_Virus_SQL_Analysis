
-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values

--Q2. If NULL values are present, update them with zeros for all columns. 

-- Q3. check total number of rows

-- Q4. Check what is start_date and end_date

-- Q5. Number of month present in dataset

-- Q6. Find monthly average for confirmed, deaths, recovered

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 

-- Q8. Find minimum values for confirmed, deaths, recovered per year

-- Q9. Find maximum values of confirmed, deaths, recovered per year

-- Q10. The total number of case of confirmed, deaths, recovered each month

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

-- Q14. Find Country having highest number of the Confirmed case

-- Q15. Find Country having lowest number of the death case

-- Q16. Find top 5 countries having highest recovered case







Certainly! Let’s break down your questions and provide SQL commands for each one. I’ll assume that the table structure in your corona_virus database includes columns like confirmed, deaths, recovered, start_date, and end_date. Here are the SQL commands for your queries:

Check NULL values:
SQL

SELECT COUNT(*) AS null_count
FROM corona_virus
WHERE confirmed IS NULL OR deaths IS NULL OR recovered IS NULL;
AI-generated code. Review and use carefully. More info on FAQ.
Update NULL values with zeros:
SQL

UPDATE corona_virus
SET confirmed = COALESCE(confirmed, 0),
    deaths = COALESCE(deaths, 0),
    recovered = COALESCE(recovered, 0)
WHERE confirmed IS NULL OR deaths IS NULL OR recovered IS NULL;
AI-generated code. Review and use carefully. More info on FAQ.
Total number of rows:
SQL

SELECT COUNT(*) AS total_rows
FROM corona_virus;
AI-generated code. Review and use carefully. More info on FAQ.
Start date and end date:
SQL

SELECT MIN(start_date) AS start_date, MAX(end_date) AS end_date
FROM corona_virus;
AI-generated code. Review and use carefully. More info on FAQ.
Number of months present in the dataset:
SQL

SELECT COUNT(DISTINCT DATE_TRUNC('month', start_date)) AS num_months
FROM corona_virus;
AI-generated code. Review and use carefully. More info on FAQ.
Monthly averages for confirmed, deaths, and recovered:
SQL

SELECT DATE_TRUNC('month', start_date) AS month,
       AVG(confirmed) AS avg_confirmed,
       AVG(deaths) AS avg_deaths,
       AVG(recovered) AS avg_recovered
FROM corona_virus
GROUP BY month;
AI-generated code. Review and use carefully. More info on FAQ.
Most frequent values for confirmed, deaths, and recovered each month:
SQL

SELECT DATE_TRUNC('month', start_date) AS month,
       MODE() WITHIN GROUP (ORDER BY confirmed) AS most_frequent_confirmed,
       MODE() WITHIN GROUP (ORDER BY deaths) AS most_frequent_deaths,
       MODE() WITHIN GROUP (ORDER BY recovered) AS most_frequent_recovered
FROM corona_virus
GROUP BY month;
AI-generated code. Review and use carefully. More info on FAQ.
Minimum values for confirmed, deaths, and recovered per year:
SQL

SELECT EXTRACT(YEAR FROM start_date) AS year,
       MIN(confirmed) AS min_confirmed,
       MIN(deaths) AS min_deaths,
       MIN(recovered) AS min_recovered
FROM corona_virus
GROUP BY year;
AI-generated code. Review and use carefully. More info on FAQ.
Maximum values for confirmed, deaths, and recovered per year:
SQL

SELECT EXTRACT(YEAR FROM start_date) AS year,
       MAX(confirmed) AS max_confirmed,
       MAX(deaths) AS max_deaths,
       MAX(recovered) AS max_recovered
FROM corona_virus
GROUP BY year;
AI-generated code. Review and use carefully. More info on FAQ.
Total number of cases (confirmed, deaths, and recovered) each month:
SQL

SELECT DATE_TRUNC('month', start_date) AS month,
       SUM(confirmed) AS total_confirmed,
       SUM(deaths) AS total_deaths,
       SUM(recovered) AS total_recovered
FROM corona_virus
GROUP BY month;
AI-generated code. Review and use carefully. More info on FAQ.
Spread of coronavirus with respect to confirmed cases:
SQL

SELECT COUNT(*) AS total_cases,
       AVG(confirmed) AS avg_confirmed,
       VARIANCE(confirmed) AS variance_confirmed,
       STDDEV(confirmed) AS stdev_confirmed
FROM corona_virus;
AI-generated code. Review and use carefully. More info on FAQ.
Spread of coronavirus with respect to death cases per month:
SQL

SELECT DATE_TRUNC('month', start_date) AS month,
       SUM(deaths) AS total_deaths,
       AVG(deaths) AS avg_deaths,
       VARIANCE(deaths) AS variance_deaths,
       STDDEV(deaths) AS stdev_deaths
FROM corona_virus
GROUP BY month;
AI-generated code. Review and use carefully. More info on FAQ.
Spread of coronavirus with respect to recovered cases:
SQL

SELECT COUNT(*) AS total_cases,
       AVG(recovered) AS avg_recovered,
       VARIANCE(recovered) AS variance_recovered,
       STDDEV(recovered) AS stdev_recovered
FROM corona_virus;
AI-generated code. Review and use carefully. More info on FAQ.
Country with the highest number of confirmed cases:
SQL

SELECT country_name, MAX(confirmed) AS max_confirmed
FROM corona_virus
GROUP BY country_name
ORDER BY max_confirmed DESC
LIMIT 1;
AI-generated code. Review and use carefully. More info on FAQ.
Country with the lowest number of death cases:
SQL

SELECT country_name, MIN(deaths) AS min_deaths
FROM corona_virus
GROUP BY country_name
ORDER BY min_deaths ASC
LIMIT 1;
AI-generated code. Review and use carefully. More info on FAQ.
Top 5 countries with the highest recovered cases:
SQL

SELECT country_name, SUM(recovered) AS total_recovered
FROM corona