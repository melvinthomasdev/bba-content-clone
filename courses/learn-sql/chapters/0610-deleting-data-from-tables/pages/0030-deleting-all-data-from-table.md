There is a table `courses` below with a few records. Let's say we decide to `delete all the data` from `courses` table.

We can use the `DELETE FROM` SQL statement for this use case as well. To delete all the records, we just need to skip the WHERE filter.

<codeblock language="sql" dbName="students3-v2.db" focusTableAfterRun="courses" type="lesson">
<code>
DELETE FROM courses
</code>
</codeblock>