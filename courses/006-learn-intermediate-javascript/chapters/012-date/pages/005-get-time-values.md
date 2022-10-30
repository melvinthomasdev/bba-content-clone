We can use `getFullYear()`
to get the year as a four-digit number.

<Editor lang="javascript">
<code>
let myDate = new Date("January 1, 2021");

console.log(myDate.getFullYear());
</code>
</Editor>

The `getMonth()` gives
the month as a number between **0** and **11**.
Here, **0** stands for January
and
**11** stands for December.

<Editor lang="javascript">
<code>
let myDate = new Date("December 2, 2020");

console.log(myDate.getMonth());
</code>
</Editor>

Similarly,
we can use
`getDate()`,
`getHours()`,
`getMinutes()`,
`getSeconds()`
and
`getMilliseconds()`
to get the desired value.
