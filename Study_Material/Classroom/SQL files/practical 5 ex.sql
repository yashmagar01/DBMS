-- step 1
-- CREATE USER jay;
-- Already created
Use pr5;

-- step 2
Grant select ON emp To jay;
Grant select ON dept To jay;

-- step 3
Grant select, insert, delete ON emp TO jay;
Grant select, insert, delete ON dept TO jay;

-- step 4
Grant update(empno, salary) ON emp to jay;

-- step 5
Revoke select, insert, delete, update ON emp From jay;
Revoke select, insert, delete, update ON dept from jay;

-- step 6
Create role dept_pvr;

-- step 7
Grant create view ON pr5 TO dept_pvr;
Grant create ON pr5 TO dept_pvr;

-- step 8
Grant dept_pvr TO jay;

-- step 9
Grant select, delete, insert ON dept To dept_pvr;

-- step 10
Grant dept_pvr TO jay;
Grant dept_pvr To john;