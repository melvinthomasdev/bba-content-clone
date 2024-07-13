Create a variable
`statesOfIndia`, value
of which is an object with
each key representing a
state and value will be the
primary language spoken.

Properties of the object are
as follows:

| Key         | Value     |
| ----------- | --------- |
| punjab      | "Punjabi" |
| gujarat     | "Gujarati"|
| maharashtra | "Marathi" |
| karnataka   | "Kannada"  |
| tamilNadu   | "Tamil"   |

Later, add another property
`kerala` value of which should
be `Malayalam`.

Make sure to add this property
using dot notation.
Log the value of `statesOfIndia`
to the console.

```js
Output:
{
  punjab: "Punjabi",
  gujarat: "Gujarati",
  maharashtra: "Marathi",
  karnataka: "Kannada",
  tamilNadu: "Tamil",
  kerala: "Malayalam"
};
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here
</code>
<solution>
const statesOfIndia ={
  punjab: "Punjabi",
  gujarat: "Gujarati",
  maharashtra: "Marathi",
  karnataka: "Kannada",
  tamilNadu: "Tamil"
};
statesOfIndia.kerala = "Malayalam";

console.log(statesOfIndia);
</solution>
</codeblock>