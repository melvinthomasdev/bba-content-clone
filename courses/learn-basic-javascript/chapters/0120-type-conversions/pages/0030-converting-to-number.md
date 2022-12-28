We can use the `Number()` method to convert a non-number value to a number.

# String to Number

A String which only contains a valid number will get converted to a Number.

<codeblock language="javascript" type="lesson">
<code>
console.log("2");
console.log(Number("2"));
</code>
</codeblock>

Empty strings get converted to 0.

<codeblock language="javascript" type="lesson">
<code>
console.log(Number(""));
</code>
</codeblock>

Non-empty Strings which don't contain a valid number get converted to `NaN`.

<codeblock language="javascript" type="lesson">
<code>
console.log(Number("2abc"));
</code>
</codeblock>

# Boolean to Number

`true` gets converted to `1`, while `false` gets converted to `0`.

<codeblock language="javascript" type="lesson">
<code>
console.log(Number(true));
console.log(Number(false));
</code>
</codeblock>

# Other data types to Number

`null` gets converted to `0`, while `undefined` gets converted to `NaN`.

<codeblock language="javascript" type="lesson">
<code>
console.log(Number(null));
console.log(Number(undefined));
</code>
</codeblock>

Calling `Number()` on `NaN` returns `NaN` itself.

<codeblock language="javascript" type="lesson">
<code>
console.log(Number(NaN));
</code>
</codeblock>