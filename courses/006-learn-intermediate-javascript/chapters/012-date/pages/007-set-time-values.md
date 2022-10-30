We can use the `setFullYear()`
to set the year as a four-digit number.
The value stored in the Date object
updates to the value provided by `setFullYear()`

<Editor lang="javascript">
<code>
let myDate = new Date("January 1, 2020");

myDate.setFullYear(1991);
console.log(myDate);
</code>
</Editor>

In the example given above,
the `myDate` variable stores
the date `January 1, 2020`.
But `setFullYear()` updates it to
`1991`.

Similarly, `setMonth()` sets
the month as a number between **0** and **11**.

<Editor lang="javascript">
<code>
let myDate = new Date("November 9, 2019");

myDate.setMonth(5);
console.log(myDate);
</code>
</Editor>

We can also use
`setDate()`,
`setHours()`,
`setMinutes()`,
`setSeconds()`
and
`setMilliseconds()`
to change the desired value
in the Date object.
