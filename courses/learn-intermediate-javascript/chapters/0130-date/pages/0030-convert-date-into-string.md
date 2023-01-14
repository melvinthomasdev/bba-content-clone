We can use `toString()`
to convert a `Date` instance into a string
containing the date, time and timezone.

<codeblock language="javascript" type="lesson">
<code>
const currentDate = new Date();
console.log(currentDate.toString());
</code>
</codeblock>

The `toDateString()` converts a `Date` into a string that only contains the date.

<codeblock language="javascript" type="lesson">
<code>
const currentDate = new Date();
console.log(currentDate.toDateString());
</code>
</codeblock>