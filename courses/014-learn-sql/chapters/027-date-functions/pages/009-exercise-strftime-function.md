Write a query to combine and display the hour and minute of the current timestamp.
For example if the datetime is `2021-04-28 15:35:29`, display `15:35`.

Set the header as `time`



<Editor lang="sql" dbName="students1.db" type="exercise">
<code>
SELECT
</code>

<solution>
SELECT STRFTIME('%H:%M', DATETIME('Now')) AS time
</solution>
</Editor>