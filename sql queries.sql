use ServiceRequests;
go

-- select * from stg_311_ServiceRequests;

-- row count
select count(*) as row_count
from stg_311_ServiceRequests

--Q1 
-- (a) Validation by Year
SELECT
    YEAR([Creation_Date]) AS RequestYear,
    COUNT(*) AS RequestCount
FROM
    stg_311_ServiceRequests
WHERE
    YEAR([Creation_Date]) BETWEEN 2018 AND 2021
GROUP BY
    YEAR([Creation_Date])
ORDER BY
    RequestYear;

-- (b) Validation by Month
SELECT
    YEAR([Creation_Date]) AS RequestYear,
    MONTH([Creation_Date]) AS RequestMonth,
    COUNT(*) AS RequestCount
FROM
    stg_311_ServiceRequests
WHERE
    YEAR([Creation_Date]) BETWEEN 2018 AND 2021
GROUP BY
    YEAR([Creation_Date]),
    MONTH([Creation_Date])
ORDER BY
    RequestYear, RequestMonth;


--Q2
SELECT
    [SOURCE],
    COUNT(*) AS RequestCount
FROM
    stg_311_ServiceRequests
GROUP BY
    [SOURCE]
ORDER BY
    RequestCount DESC;


--Q3
SELECT
    [DEPARTMENT],
    COUNT(*) AS RequestCount
FROM
    stg_311_ServiceRequests
GROUP BY
    [DEPARTMENT]
ORDER BY
    RequestCount DESC;


--Q5
SELECT TOP 10
    [NEIGHBORHOOD],
    COUNT(*) AS RequestCount
FROM
    stg_311_ServiceRequests
GROUP BY
    [NEIGHBORHOOD]
ORDER BY
    RequestCount DESC;


--Q6
SELECT
    [DEPARTMENT],
    [WORK GROUP],
    COUNT(*) AS WorkloadCount
FROM
    stg_311_ServiceRequests
GROUP BY
    [DEPARTMENT],
    [WORK GROUP]
ORDER BY
    WorkloadCount DESC , [DEPARTMENT] ;


--Q7
--Can't be validated due to the presence of NULL values


--Q8
SELECT
    YEAR([Creation_Date]) AS RequestYear,
    [STATUS],
    COUNT(*) AS StatusCount
FROM
    stg_311_ServiceRequests
WHERE
    YEAR([Creation_Date]) BETWEEN 2018 AND 2021
GROUP BY
    YEAR([Creation_Date]),
    [STATUS]
ORDER BY
    RequestYear, [STATUS];


--Q9
SELECT TOP 10
    [CATEGORY1],
    AVG([DAYS TO CLOSE]) AS AvgDaysToClose
FROM
    stg_311_ServiceRequests
WHERE
-- days to close null values are not included
    [DAYS TO CLOSE] IS NOT NULL 
GROUP BY
    [CATEGORY1]
ORDER BY
    AvgDaysToClose DESC;


--Q10
SELECT
    [DEPARTMENT],
    COUNT(DISTINCT [CASE ID]) AS CaseCount,
    COUNT(*) AS Workload,
    AVG([DAYS TO CLOSE]) AS AvgDaysToClose
FROM
    stg_311_ServiceRequests
WHERE
-- -- days to close null values are not included
    [DAYS TO CLOSE] IS NOT NULL 
GROUP BY
    [DEPARTMENT];
