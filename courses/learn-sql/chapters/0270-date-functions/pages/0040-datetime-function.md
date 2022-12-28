The DATETIME function combines the features of both DATE and TIME functions.
It displays both date and time together.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT DATETIME('Now')
</code>
</codeblock>

The time shown by DATETIME is UTC time by default.
If we want to display the local time, we can add a parameter 'localtime' to the DATETIME function.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT DATETIME('Now', 'localtime')
</code>
</codeblock>

The 'Now' parameter in DATETIME function is case-insensitive.
'NOW' and 'now' would produce the same result as 'Now'.

<codeblock language="sql" dbName="students1.db" type="lesson">
<code>
SELECT DATETIME('NOW', 'localtime')
</code>
</codeblock>