We can use the `setFullYear()` method on a `Date` instance,
to update the year value of that instance.

<codeblock language="javascript" type="lesson">
<code>
const createDate = new Date("January 1, 2020");

createDate.setFullYear(1991);
console.log(createDate);
</code>
</codeblock>

In the example given above,
the `createDate` variable initially
had the date `January 1, 2020`.
`createDate.setFullYear(1991)` updated it to
`January 1, 1991`.

Similarly, `setMonth()` can be used to update
the month of a Date instance.
It accepts a number between **0** and **11** that represents
the month to which the Date instance is to be updated.
**0** represents January
and
**11** represents December.

<codeblock language="javascript" type="lesson">
<code>
const createDate = new Date("November 9, 2019");
createDate.setMonth(5);
console.log(createDate);
</code>
</codeblock>

We can also use
`setDate()`,
`setHours()`,
`setMinutes()`,
`setSeconds()`
and
`setMilliseconds()`
to update the desired value
in the Date object.
