SELECT * FROM Salaries LIMIT 10;

SELECT * FROM Salaries ORDER BY salary DESC LIMIT 20;

SELECT * FROM Salaries WHERE yearId = '2010'
ORDER BY salary DESC LIMIT 30;

--CONDITION
SELECT * FROM Salaries WHERE playerId = 'rodrial01' ORDER BY yearId ASC;

-- SUM and AVG
SELECT sum(salary) FROM Salaries WHERE playerId='rodrial01';
SELECT avg(salary) FROM Salaries WHERE playerId='rodrial01';

--CONCAT and DISTINCT FUNCTION
SELECT nameFirst || ' ' || nameLast AS 'name' FROM People LIMIT 10;
SELECT nameFirst ||' '||nameLast AS 'Name' FROM People WHERE playerId='rodrial01';

SELECT COUNT(DISTINCT(nameFirst||' '||nameLast)) FROM People;
SELECT nameFirst||' '||nameLast AS name,COUNT(*) FROM People GROUP BY name HAVING COUNT(*) > 2;

SELECT teamId,yearId AS year, sum(salary) AS total_salary FROM Salaries GROUP BY teamId ORDER BY sum(salary) DESC;

--JOIN
--When we need two data from different domain
SELECT
    t2.nameFirst||' '||nameLast AS name,
    t1.salary
    FROM
        Salaries t1
    JOIN
        People t2 ON t2.playerID = t1.playerID
    ORDER BY salary DESC
    LIMIT 30;

--JOIN and GROUP BY

    SELECT
        t2.teamID,
        t1.nameFirst||' '||nameLast as name,
        MAX(t2.salary) AS max_salary
    FROM
        People t1
    JOIN
        Salaries t2 ON t2.playerID = t1.playerID
    WHERE
        t2.yearID = 2010
    GROUP BY 
        t2.teamID
    ORDER BY
        MAX(salary) DESC;
    
--LEFT JOIN
SELECT
    t1.playerID,
    COUNT(*)
FROM
    People t1
LEFT JOIN
    AllstarFull t2 ON t2.playerID=t1.playerID
GROUP BY 1
ORDER BY COUNT(*) DESC;
--column 1
    
--WHERE
--  t2.playerID IS NULL


--CREATE TABLE
CREATE TABLE mytable (id INT,name VARCHAR(255),debut DATE);
CREATE TABLE mytable2 (id INT