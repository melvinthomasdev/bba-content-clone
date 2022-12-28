Currently in the students table there are two types of information - students information and course information.

<image containerClasses="flex justify-center" imageClasses="h-72">students-table.png</image>

So a single table contains information about two different entities.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT name, course
FROM   students
</code>
</codeblock>

In the real world we need to keep more information about both the students and the courses.
We need to track information like student's address, parents address, student's grades etc.
Similarly we need to track more information about courses too. Who is teaching what course
at what time.  It's better to keep the information about courses in a separate table called "courses".
In this way "students" table will be about students and the "courses" table will be about "courses".

Here is how our new courses table looks like:

<image containerClasses="flex justify-center" imageClasses="h-72">courses-table.png</image>

You can achieve the same result in the code editor given below:

<codeblock language="sql" dbName="students2-v4.db" displayDbOnly="true" type="lesson">
<code>
SELECT *
FROM courses
</code>
</codeblock>

Now we have course information at two places - at the students table and at the courses table.
We need to remove "course" column from the "students" table.

Here is our new students table after removing the "course" column.

<codeblock language="sql" dbName="students2-v5.db" displayDbOnly="true" type="lesson">
<code>
SELECT *
FROM   students
</code>
</codeblock>

Now we have a problem. How do we know which student is taking which course.
To solve this problem, we need to understand what is a primary key.

In USA there are [48,110 people](http://howmanyofme.com/people/john_smith/) with name "John Smith".
Then how do we identify which John Smith we are dealing with when they open bank account.
Well each John Smith is given a unique number. In USA it is their social security number.
Also the passport number of each John Smith would be different.

Similarly in the database world we might have two students with the name "John Smith".
However the id of these two students would be different. In our students table "id"
is the first column.

Coming back to the issue of how do we identify which student is taking which course we can
add "courseId" column to the students table and that courseId would contain the primary key of
the courses table.

<image containerClasses="flex justify-center" imageClasses="h-72">students-ID-table.png</image>

After making that change now our table looks like this and now we can select students name
and their courseId.

<image>relationship-table.png</image>

To achieve the same result in SQL,
look at this code example:

<codeblock language="sql" dbName="students2-v1.db" focusTableBeforeRun="courses" type="lesson">
<code>
SELECT name, courseId
FROM   students
</code>
</codeblock>

Notice, that we have a new table `courses` above which contains `id`, `name` and `abbreviatedName` for a few courses. The `course` column from `students` table from earlier is gone. In its place, we have a `courseId` column. This `courseId` column contains a reference to the course the student is enrolled in, by storing the actual `id` of the course from the `courses` table.

For example, in `courseId` for student `Johnson`, the `courseId` is 1. This means `Johnson` is enrolled in the course `JavaScript`(`id` 1).


But now, how do we get a result containing names of all students and the courses they are enrolled in from this new set of tables, similar to query at the top of this page?

That's what we will explore in the next few chapters.




