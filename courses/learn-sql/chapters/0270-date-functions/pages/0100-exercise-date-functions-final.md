Write a query to display the datetime timestamps of

1. time exactly 4 days after the current time in UTC
2. time at the beginning of the current day in UTC

both in the format `DD/MM/YYYY HH:MM`. Example: `27/01/2023 12:18`

Set headers for values as `time4DaysLater` and `timeCurrentDayStart` respectively.

<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput" cache="false">
<code>
SELECT
</code>

<solution>
SELECT STRFTIME('%d/%m/%Y %H:%M', DATETIME('Now', '4 days')) AS time4DaysLater,
       STRFTIME('%d/%m/%Y %H:%M', DATETIME('Now', 'localtime', 'Start of Day')) AS timeCurrentDayStart
</solution>
</codeblock>
