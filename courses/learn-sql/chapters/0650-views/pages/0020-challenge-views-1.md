Write a set of SQL statements to:

1. Create a VIEW `basicStudentData` that contains these four columns: `name`, `age`, `grade`, `marks`. The data should be the name, age, grade and marks for all the students.

2. Display all data from the VIEW `basicStudentData`.



<codeblock language="sql" dbName="students2-v3.db" type="exercise" checkForViews="basicStudentData" testMode="fixedInput">
<code>

</code>

<solution>
CREATE VIEW basicStudentData AS
SELECT name,
       age,
       grade,
       marks
FROM   students;

SELECT *
FROM   basicStudentData
</solution>
</codeblock>