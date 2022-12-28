We have the `students` table again. Let's say we decide to enroll all students who have scored more than `80` marks in the `Ruby` course, and promote all of them to grade `12`.

To solve this, the `UPDATE` statement can also be used to update multiple columns.

<codeblock language="sql" dbName="students3-v1.db" focusTableAfterRun="students" type="lesson">
<code>
UPDATE students
SET    course = 'Ruby',
       grade = 12
WHERE  marks > 80
</code>
</codeblock>

To update multiple columns, we simply need to add multiple expressions to the `SET` list, separated by `,`.
