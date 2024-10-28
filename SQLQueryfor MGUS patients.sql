

--Finding out which gender is affected the most with MGUS


SELECT
    sex,
    COUNT(*) AS count
FROM
    mgus..mgus2$
GROUP BY sex
   
   
   	 

--Finding out which age group is affected the most by Mgus

SELECT
CASE 
        WHEN age BETWEEN 0 AND 9 THEN '0-9'
        WHEN age BETWEEN 10 AND 19 THEN '10-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
        WHEN age BETWEEN 70 AND 79 THEN '70-79'
        ELSE '80+'
    END AS agegroup,
    count(age) AS total_cases
FROM mgus..mgus2$
    
GROUP BY
    CASE 
        WHEN age BETWEEN 0 AND 9 THEN '0-9'
        WHEN age BETWEEN 10 AND 19 THEN '10-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
        WHEN age BETWEEN 70 AND 79 THEN '70-79'
        ELSE '80+'
	
    END 
ORDER BY
    total_cases DESC


    
	--Whats the average time span of death after diagnosis based on your present age
	
	Select 

	CASE 
        WHEN age BETWEEN 0 AND 9 THEN '0-9'
        WHEN age BETWEEN 10 AND 19 THEN '10-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
        WHEN age BETWEEN 70 AND 79 THEN '70-79'
        ELSE '80+'
    END AS agegroup,
	AVG(ptime)AS AVERAGETIME
	
	from  mgus..mgus2$
	group by 
	CASE 
        WHEN age BETWEEN 0 AND 9 THEN '0-9'
        WHEN age BETWEEN 10 AND 19 THEN '10-19'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
        WHEN age BETWEEN 70 AND 79 THEN '70-79'
        ELSE '80+'
		end
	
	--Is there a corellation between Mspike and a plasma cell Malignancy?
	
	SELECT DISTINCT (a.MSPIKE), b.PTIME
	FROM mgus..mgus2$ a
	JOIN mgus..mgus2$ b ON a.MSPIKE= b.PTIME
	
	
	select COUNT(DISTINCT mspike) as numberofoccurences
	
	FROM mgus..mgus2$ 
	--
--This calculates how many markers of Mspike per values.

 SELECT 
  mspike, COUNT(*) AS count
FROM mgus..mgus2$ 
GROUP BY 
    mspike;

	--Using Pearson Coefficient to compare two values in the table MGUS2. this measures how Mspike and ptime 
	-- are strongly related

	SELECT 
    (SUM(mspike * ptime) - SUM(mspike) * SUM(ptime) / COUNT(*)) / 
    (SQRT((SUM(mspike * mspike) - SUM(mspike) * SUM(mspike) / COUNT(*)) * 
    (SUM(ptime * ptime) - SUM(ptime) * SUM(ptime) / COUNT(*)))) AS correlation
FROM 
  mgus..mgus2$  ;


