We can use `getFullYear()` method on a Date instance
to get the year of the instance as a four-digit number.

<codeblock language="javascript" type="lesson">
<code>
const updateDate = new Date("January 1, 2021");

console.log(updateDate.getFullYear());
</code>
</codeblock>

The `getMonth()` gives
the month as a number between **0** and **11**.
Here, **0** represents January
and
**11** represents December.

<codeblock language="javascript" type="lesson">
<code>
const creationDate = new Date("December 2, 2020");
console.log(creationDate.getMonth());
</code>
</codeblock>

Similarly,
we can use
`getDate()`,
`getHours()`,
`getMinutes()`,
`getSeconds()`
and
`getMilliseconds()`
to get the desired value.
