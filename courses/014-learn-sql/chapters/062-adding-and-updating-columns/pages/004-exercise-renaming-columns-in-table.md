Write an SQL statement to update the name of the column `abbreviatedName` to `abbreviation` in the table `courses`.




<Editor lang="sql" dbName="students3-v2.db" focusTableAfterRun="courses" type="exercise">
<code>

</code>

<solution>
ALTER TABLE    courses
RENAME COLUMN  abbreviatedName TO abbreviation
</solution>
</Editor>