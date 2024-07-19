Create a variable
`countries`, value
of which is an object with
each key representing a
country and value will be the
primary language spoken.

Properties of the object are
as follows:

| Key         | Value      |
| ----------- | ---------- |
| germany     | "German"   |
| spain       | "Spanish"  |
| france      | "French"   |
| japan       | "Japanese" |
| italy       | "Italian"  |

Later, add another property
`brazil` value of which should
be `Portuguese`.

Make sure to add this property
using dot notation.
Log the value of `countries`
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here
</code>
<solution>
const countries = {
  germany: "German",
  spain: "Spanish",
  france: "French",
  japan: "Japanese",
  italy: "Italian"
};

countries.brazil = "Portuguese";

console.log(countries);
</solution>
</codeblock>
