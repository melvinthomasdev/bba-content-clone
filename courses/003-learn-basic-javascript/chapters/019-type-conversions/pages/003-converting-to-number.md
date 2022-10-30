We can use the `Number()` method to convert a non-number value to a number.

# String to Number

A String which contains a valid number as its value will be converted to a Number.

<Editor lang="javascript">
<code>
console.log("2");
console.log(Number("2"));
</code>
</Editor>

Empty strings are converted to 0.

<Editor lang="javascript">
<code>
console.log(Number(""));
</code>
</Editor>

Non-empty Strings which don't contain a valid number are converted to `NaN`.

<Editor lang="javascript">
<code>
console.log(Number("2abc"));
</code>
</Editor>

# Boolean to Number

`true` is converted to 1, while `false` is converted to 0.

<Editor lang="javascript">
<code>
console.log(Number(true));
console.log(Number(false));
</code>
</Editor>

# Other data types to Number

`null` is converted to 0, while `undefined` is converted to `NaN`.

<Editor lang="javascript">
<code>
console.log(Number(null));
console.log(Number(undefined));
</code>
</Editor>

Calling `Number()` on `NaN` returns `NaN` itself.

<Editor lang="javascript">
<code>
console.log(Number(NaN));
</code>
</Editor>