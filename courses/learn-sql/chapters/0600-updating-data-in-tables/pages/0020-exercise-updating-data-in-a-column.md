We have a table `courses` below. Write an SQL statement to update the `abbreviatedName` for the course with name `C#`, to `csharp`.



<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="courses" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
UPDATE courses
SET abbreviatedName = 'csharp'
WHERE name = 'C#'
</solution>
</codeblock>