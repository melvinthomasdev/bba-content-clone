The table `students` contains a column `studentMentorId`. It stores the `id` of another student who is a mentor of the student in a particular row.

Let's say we want to display the name of all students who have a mentor, along with the name of their mentors. Let's name the headers `studentName` and `mentorName` respectively.

In this case, the data for both our result columns, belongs to one and the same column in `students`, i.e. `name`. So, we need join the table `students` with itself. This kind of a `JOIN` is called a `SELF JOIN`.

We cannot mention the same combination of `table name + column name` in the `SELECT` list more than once, so we will use table aliases to achieve that. Here is how we need to do it.

<Editor lang="sql" dbName="students2-v3.db">
<code>
SELECT s1.name AS studentName,
       s2.name AS mentorName
FROM   students s1 JOIN students s2
ON     s1.studentMentorId = s2.id
</code>
</Editor>

Note that we have used two different aliases `s1` and `s2` for the same table `students`, and then we can treat them as two different tables and apply standard `JOIN` logic to them.