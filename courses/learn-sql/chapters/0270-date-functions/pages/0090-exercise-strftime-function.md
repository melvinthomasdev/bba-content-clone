Write a query to combine and display the hour and minute of the current timestamp.
For example if the datetime is `2021-04-28 15:35:29`, display `15:35`.

Set the header as `time`



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
</code>

<solution>
SELECT STRFTIME('%H:%M', DATETIME('Now')) AS time
</solution>
</codeblock>