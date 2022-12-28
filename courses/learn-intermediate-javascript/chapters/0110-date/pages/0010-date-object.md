The `Date` object can be used to represent a particular moment in time.
It also has a lot of useful methods that can be used for time manipulation.

`new Date()` returns a Date instance representing the current date and time,
as show in the example given below.

<codeblock language="javascript" type="lesson">
<code>
const currentDate = new Date();
console.log(currentDate);
</code>
</codeblock>

We can also get a Date instance representing a specific time
by passing an argument to the constructor.
The argument can be the number of milliseconds that has passed
since `January 1, 1970, 00:00:00 UTC` to the specific date and time,
or
it can be a string that represents the specific data and time.
In the example below,
we are passing a date as a string using the `YYYY-MM-DD` format.

<codeblock language="javascript" type="lesson">
<code>
const startDate2021 = new Date("2021-01-01");
console.log(startDate2021);
</code>
</codeblock>

In the example given above,
the time is not specified.
In such cases,
the time is defaulted to `00:00:00`.

You can change the argument from
**"2021-01-01"** to **"December 02, 2021 23:45:01"**
inside the `Date()` method to
observe how the output looks.
