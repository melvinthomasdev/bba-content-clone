The `shift()` method removes the first element of an array.

<codeblock language="javascript" type="lesson">
<code>
const sports = ["Football", "Cricket", "Basketball"];
sports.shift();

console.log(sports);
</code>
</codeblock>

In the example given above,
`sports.shift()`
removes the first element **"Football"**
from the array `sports`.

The `shift()` method also returns the element that was removed,
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const sports = ["Football", "Cricket", "Basketball"];
console.log(sports.shift());
</code>
</codeblock>