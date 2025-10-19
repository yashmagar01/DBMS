use pr8;
-- step 1
SELECT n AS num, POW(n, 3) AS cubed
FROM (SELECT 12 AS n UNION ALL SELECT 14 UNION ALL SELECT 16) AS t;

-- step 2
SELECT empno, ename, sal AS original_sal, CEIL(sal) AS sal_roundup
FROM emp;
