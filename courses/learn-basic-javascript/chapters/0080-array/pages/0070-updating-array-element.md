We can update the value of
an array element by
first accessing the element
via its index
and
then assigning a new value to it.

In the example given below,
we are updating the value of
the second element from
`"Cricket"` to `"Hockey"`.

<codeblock language="javascript" type="lesson">
<code>
const sports = ["Football", "Cricket", "Basketball"];
sports[1] = "Hockey";

console.log(sports);
</code>
</codeblock>