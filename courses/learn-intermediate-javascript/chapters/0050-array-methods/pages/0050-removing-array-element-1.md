The `pop()` method removes the last element of an array.

<codeblock language="javascript" type="lesson">
<code>
const sports = ["Football", "Cricket", "Basketball"];
sports.pop();

console.log(sports);
</code>
</codeblock>

In the example given above,
`sports.pop()`
removes the last element **"Basketball"**
from the array `sports`.

The `pop()` method also returns the element that was removed,
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const sports = ["Football", "Cricket", "Basketball"];
const lastElement = sports.pop();
console.log(lastElement);
</code>
</codeblock>