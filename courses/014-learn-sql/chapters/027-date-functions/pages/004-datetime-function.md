The DATETIME function combines the features of both DATE and TIME functions.
It displays both date and time together.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT DATETIME('Now')
</code>
</Editor>

The time shown by DATETIME is UTC time by default.
If we want to display the local time, we can add a parameter 'localtime' to the DATETIME function.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT DATETIME('Now', 'localtime')
</code>
</Editor>

The 'Now' parameter in DATETIME function is case-insensitive.
'NOW' and 'now' would produce the same result as 'Now'.

<Editor lang="sql" dbName="students1.db">
<code>
SELECT DATETIME('NOW', 'localtime')
</code>
</Editor>