Write a query to display the current datetime timestamp in UTC and the current datetime timestamp in local timezone.
Set headers for values as `currentTimeUtc` and `currentTimeLocal` respectively.



<codeblock language="sql" dbName="students1.db" type="exercise" testMode="fixedInput">
<code>
SELECT
</code>

<solution>
SELECT DATETIME('Now') AS currentTimeUtc,
       DATETIME('Now', 'localtime') AS currentTimeLocal
</solution>
</codeblock>