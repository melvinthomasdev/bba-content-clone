Let's say we want to display the names of all unique not-null courses.
For each of these courses names
display names of all students enrolled in the course.
Separate the names of students using a comma.

In this case, we need to group the data by `course`.
However instead of getting an aggregate data from rows grouped by course, we need to combine all names in the group.

SQL provides `GROUP_CONCAT`, a combination clause over `GROUP BY`, that solves the exact same problem.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT course, GROUP_CONCAT(name) as students
FROM students
WHERE course IS NOT NULL
GROUP BY course
</code>
</Editor>

The `GROUP_CONCAT` function returns the combined data separated by a `,` by default.
If we want to use a different separator, the `GROUP_CONCAT` function can take a second argument, to specify the separator.
Check the query below to return a similar result as above, but using a `|` as a separator.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT course, GROUP_CONCAT(name, ' | ') as students
FROM students
WHERE course IS NOT NULL
GROUP BY course
</code>
</Editor>