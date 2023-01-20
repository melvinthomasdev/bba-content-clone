Sometimes we need to explicitly
convert a value to string.
In such cases,
we can use either `String()`
or
`toString()`
to convert a non-string value to a string.

# Number to String

<codeblock language="javascript" type="lesson">
<code>
console.log(2);
console.log(String(2));
console.log((2).toString());
</code>
</codeblock>

# Boolean to String

<codeblock language="javascript" type="lesson">
<code>
console.log(true);
console.log(String(true));
console.log(true.toString());
</code>
</codeblock>

However,
when we need to convert
`null`,
or
`undefined`
into a string,
we can only use `String()`.
Using `toString()` in such cases
will give us an error.

In the example given below,
the first `console.log` displays the string
and
the second `console.log` results in an error.

<codeblock language="javascript" type="lesson">
<code>
console.log(String(null));
console.log(null.toString());
</code>
</codeblock>

You can replace `null` with `undefined`,
in the example given above
and
see the changes in the output.