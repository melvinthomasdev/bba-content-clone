There is a `students` table below with a few columns. The table `studentsClone` has the exact same number and type of columns as `students`. The table `studentsMarks` has only `id`, `name` and `marks` columns that are same as `students`, and a few extra columns. Neither `studentsClone`, nor `studentsMarks` have any records.

Write a set of SQL statements to:

1. Copy all the records for all columns in the same order, from `students` to `studentsClone`
2. Copy all the records for the columns `id`, `name` and `marks` from `students` to `studentsMarks`. Leave the values for extra columns in `studentsMarks` as `NULL`.



<Editor lang="sql" dbName="students3-v6.db" focusTableAfterRun="studentsClone" type="exercise">
<code>
INSERT INTO

INSERT INTO
</code>

<solution>
INSERT INTO studentsClone
SELECT * FROM students;

INSERT INTO studentsMarks (id, name, marks)
SELECT id, name, marks FROM students;
</solution>
</Editor>