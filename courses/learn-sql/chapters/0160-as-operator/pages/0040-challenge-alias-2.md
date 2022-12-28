Let's display only the `id`, `grade` and `course` of students.
The column name for ids should be _studentId_ and the column name for
grades should be _studentGrade_.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
id,
grade,
course
FROM students;
</code>

<solution>
SELECT
id AS studentId,
grade AS studentGrade,
course
FROM students;
</solution>
</codeblock>