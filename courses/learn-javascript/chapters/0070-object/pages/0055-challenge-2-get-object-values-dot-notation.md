Create a variable
`statesOfIndia`, value
of which is an object with
each key representing a
state and value will be the
primary language spoken.

Properties of the object are
as follows:

| Key         | Value      |
| ----------- | ---------- |
| punjab      | "Punjabi"  |
| gujarat     | "Gujarati" |
| maharashtra | "Marathi"  |
| karnataka   | "Kannada"  |
| tamilNadu   | "Tamil"    |

Later, log the value of `gujarat`
and `tamilNadu` to the console
using dot notation.

```js
Output:
"Gujarati"
"Tamil"
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here
</code>
<solution>
const statesOfIndia = {
  punjab: "Punjabi",
  gujarat: "Gujarati",
  maharashtra: "Marathi",
  karnataka: "Kannada",
  tamilNadu: "Tamil"
};

console.log(statesOfIndia.gujarat);
console.log(statesOfIndia.tamilNadu);
</solution>
</codeblock>
