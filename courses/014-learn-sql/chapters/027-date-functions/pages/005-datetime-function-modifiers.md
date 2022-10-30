We can also add or subtract date time from current date time. For example, for adding 2 days in current datetime, we can add another parameter to DATETIME function.

<Editor lang="sql" dbName="clean-slate.db">
<code>
SELECT DATETIME('now', '+2 days')
</code>
</Editor>

Similarly for subtracting 2 months from the current date, we can write the query below.

<Editor lang="sql" dbName="clean-slate.db">
<code>
SELECT DATETIME('now', '-2 months')
</code>
</Editor>

For positive numbers putting **+** before the number is optional.

We can add more than one modifiers to a DATETIME function. Let's say we have get the datetime timestamp of +3 years to the current localtime.

<Editor lang="sql" dbName="clean-slate.db">
<code>
SELECT DATETIME('now', 'localtime', '3 years')
</code>
</Editor>

There are more modifiers like 'Start of Day', 'Start of Month', 'Start of Year'.
These can be used to get the timestamps of start of day, month and year relative to the current timestamp.

<Editor lang="sql" dbName="clean-slate.db">
<code>
SELECT DATETIME('now', 'localtime', 'Start of Day');
</code>
</Editor><Editor lang="sql" dbName="clean-slate.db">
<code>
SELECT DATETIME('now', 'localtime', 'Start of Month');
</code>
</Editor><Editor lang="sql" dbName="clean-slate.db">
<code>
SELECT DATETIME('now', 'localtime', 'Start of Year');
</code>
</Editor>