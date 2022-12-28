Write a query to display the datetime timestamps of

1. time exactly 4 days after the current time in UTC
2. time at the beginning of the current day in local time

<br>

Set headers for values as `time4DaysLater` and `timeCurrentDayStart` respectively.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
</code>

<solution>
SELECT DATETIME('Now', '4 days') AS time4DaysLater,
       DATETIME('Now', 'localtime', 'Start of Day') AS timeCurrentDayStart
</solution>
</codeblock>