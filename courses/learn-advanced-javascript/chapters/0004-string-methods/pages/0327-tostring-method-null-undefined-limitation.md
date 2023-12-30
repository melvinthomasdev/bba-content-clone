`toString()` method also throws an error
in the case of `null` and `undefined`.

Let us have a look at another example
related to `null` and `undefined`:
<codeblock language="javascript" type="lesson">
<code>
// The following code will result in an error
console.log(null.toString());
console.log(null.toString()); 
</code>
</codeblock>

When dealing with such cases, 
we can use the `String()` method.
