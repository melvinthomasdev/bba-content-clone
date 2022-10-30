We can use `new Date()`
to store the current date and time
in a variable.

<Editor lang="javascript">
<code>
let myDate = new Date();
console.log(myDate);
</code>
</Editor>

We can also include
the date in the `YYYY-MM-DD`
or
`Month DD, YYYY` format.

In the example given below,
we are using the `YYYY-MM-DD` format.

<Editor lang="javascript">
<code>
let myDate = new Date("2021-01-01");
console.log(myDate);
</code>
</Editor>

You can change the argument from
**2021-01-01** to **December 02, 2021**
inside the `Date()` method to
observe how the output looks.