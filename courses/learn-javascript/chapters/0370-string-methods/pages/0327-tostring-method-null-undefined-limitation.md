The `toString()` method throws an error
in the case of `null` and `undefined`.

Let us have a look at `null` and `toString()`:
<codeblock language="javascript" type="lesson">
<code>
// The following code will result in an error
console.log(null.toString());
</code>
</codeblock>

The same thing happens with `undefined`:
<codeblock language="javascript" type="lesson">
<code>
// The following code will result in an error
console.log(undefined.toString());
</code>
</codeblock>

When dealing with such cases,
we can use the `String()` method.
