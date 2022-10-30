Find all the courses in which at least one student is enrolled.

The problem seems easy enough.
We need to list items from the `course` columns.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT course
FROM students
</code>
</Editor>

In the result we can see Python 3 times.
Similarly Java is also appearing more than once.
That's not what we wanted.

We want a unique list of all courses which have at least one student enrolled in.
This is what DISNTICT does.
DISTINCT always returns a unique list.
Result returned by DISTINCT won't have an item more than once.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT DISTINCT course
FROM students
</code>
</Editor>