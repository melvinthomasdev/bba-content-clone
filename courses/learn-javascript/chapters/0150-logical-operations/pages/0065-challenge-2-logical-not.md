If the weather is rainy,
log to the console:
`Don't forget your umbrella.`

If not, log the following:
`It's a sunny day!`

Make sure to use the **not**
operator.
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const isRainy = true;
// Write code below
</code>

<solution>
const isRainy = true;
// Write code below
if (!isRainy) {
  console.log("It's a sunny day!");
} else {
  console.log("Don't forget your umbrella.");
};
</solution>
</codeblock>