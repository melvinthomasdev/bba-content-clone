Use the `toFixed()` method to convert
the value of `exactValue` to have only
**three** digits after the decimal point,
and store the value in `fixedValue`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const exactValue = 10.7654321;
const fixedValue = ;
console.log(fixedValue);
</code>

<solution>
const exactValue = 10.7654321;
const fixedValue = exactValue.toFixed(3);
console.log(fixedValue);
</solution>
</codeblock>