USE corona_virus;
-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values

SELECT *
FROM `corona virus dataset`
WHERE `Province` IS NULL OR `Country/Region` IS NULL OR `Latitude` IS NULL OR `Longitude` IS NULL OR `Date`
IS NULL OR `Confirmed` IS NULL OR `Deaths` IS NULL OR `Recovered` IS NULL;


-- Q2. If NULL values are present, update them with zeros for all columns. 
UPDATE `corona virus dataset`
SET `Province` = COALESCE(`Province`, '0'),
    `Country/Region` = COALESCE(`Country/Region`, '0'),
    `Latitude` = COALESCE(`Latitude`, 0),
    `Longitude` = COALESCE(`Longitude`, 0),
    `Date` = COALESCE(`Date`, '0000-00-00'),
    `Confirmed` = COALESCE(`Confirmed`, 0),
    `Deaths` = COALESCE(`Deaths`, 0),
    `Recovered` = COALESCE(`Recovered`, 0);


-- Q3. check total number of rows
SELECT COUNT(*) AS Total_Rows
FROM `corona virus dataset`;


-- Q4. Check what is start_date and end_date
SELECT MIN(STR_TO_DATE(`Date`, '%d-%m-%Y')) AS Start_Date, MAX(STR_TO_DATE(`Date`, '%d-%m-%Y')) AS End_Date
FROM `corona virus dataset`;


-- Q5. Number of month present in dataset
SELECT COUNT(DISTINCT DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m')) AS Num_Months
FROM `corona virus dataset`;


-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m') AS Month,
       AVG(`Confirmed`) AS Avg_Confirmed,
       AVG(`Deaths`) AS Avg_Deaths,
       AVG(`Recovered`) AS Avg_Recovered
FROM `corona virus dataset`
GROUP BY DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m');


-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
SELECT DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m') AS Month,
       MAX(`Confirmed`) AS Most_Frequent_Confirmed,
       MAX(`Deaths`) AS Most_Frequent_Deaths,
       MAX(`Recovered`) AS Most_Frequent_Recovered
FROM `corona virus dataset`
GROUP BY DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m')
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT YEAR(STR_TO_DATE(`Date`, '%d-%m-%Y')) AS Year,
       MIN(`Confirmed`) AS Min_Confirmed,
       MIN(`Deaths`) AS Min_Deaths,
       MIN(`Recovered`) AS Min_Recovered
FROM `corona virus dataset`
GROUP BY YEAR(STR_TO_DATE(`Date`, '%d-%m-%Y'));


-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT YEAR(STR_TO_DATE(`Date`, '%d-%m-%Y')) AS Year,
       MAX(`Confirmed`) AS Max_Confirmed,
       MAX(`Deaths`) AS Max_Deaths,
       MAX(`Recovered`) AS Max_Recovered
FROM `corona virus dataset`
GROUP BY YEAR(STR_TO_DATE(`Date`, '%d-%m-%Y'));


-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m') AS Month,
       SUM(`Confirmed`) AS Total_Confirmed,
       SUM(`Deaths`) AS Total_Deaths,
       SUM(`Recovered`) AS Total_Recovered
FROM `corona virus dataset`
GROUP BY DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m');


-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT COUNT(`Confirmed`) AS Total_Confirmed_Cases,
       AVG(`Confirmed`) AS Average_Confirmed_Cases,
       VARIANCE(`Confirmed`) AS Confirmed_Variance,
       STDDEV(`Confirmed`) AS Confirmed_STDDEV
FROM `corona virus dataset`;


-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m') AS Month,
       COUNT(`Deaths`) AS Total_Death_Cases,
       AVG(`Deaths`) AS Average_Death_Cases,
       VARIANCE(`Deaths`) AS Death_Variance,
       STDDEV(`Deaths`) AS Death_STDDEV
FROM `corona virus dataset`
GROUP BY DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m');



-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m') AS Month,
       COUNT(`Recovered`) AS Total_Recovered_Cases,
       AVG(`Recovered`) AS Average_Recovered_Cases,
       VARIANCE(`Recovered`) AS Recovered_Variance,
       STDDEV(`Recovered`) AS Recovered_STDDEV
FROM `corona virus dataset`
GROUP BY DATE_FORMAT(STR_TO_DATE(`Date`, '%d-%m-%Y'), '%Y-%m');



-- Q14. Find Country having highest number of the Confirmed case
SELECT `Country/Region`, MAX(`Confirmed`) AS Highest_Confirmed_Cases
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY MAX(`Confirmed`) DESC
LIMIT 1;


-- Q15. Find Country having lowest number of the death case
SELECT `Country/Region`, MIN(`Deaths`) AS Lowest_Death_Cases
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY MIN(`Deaths`) ASC
LIMIT 1;


-- Q16. Find top 5 countries having highest recovered case
SELECT `Country/Region`, SUM(`Recovered`) AS Total_Recovered_Cases
FROM `corona virus dataset`
GROUP BY `Country/Region`
ORDER BY SUM(`Recovered`) DESC
LIMIT 5;


