We can use `toString()`
to convert the `Date` into a string
containing the date, time and timezone.

<Editor lang="javascript">
<code>
let myDate = new Date();

console.log(myDate.toString());
</code>
</Editor>

The `toDateString()` also converts
the `Date` into a string.
But it does not contain
the time and timezone.

<Editor lang="javascript">
<code>
let myDate = new Date();

console.log(myDate.toDateString());
</code>
</Editor>