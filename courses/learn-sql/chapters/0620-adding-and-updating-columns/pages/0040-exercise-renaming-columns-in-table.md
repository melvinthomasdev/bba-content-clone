Write an SQL statement to update the name of the column `abbreviatedName` to `abbreviation` in the table `courses`.




<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="courses" type="exercise" testMode="fixedInput">
<code>

</code>

<solution>
ALTER TABLE    courses
RENAME COLUMN  abbreviatedName TO abbreviation
</solution>
</codeblock>