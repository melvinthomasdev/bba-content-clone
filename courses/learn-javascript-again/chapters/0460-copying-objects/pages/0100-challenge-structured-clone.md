Create a deep clone of `player`
object as `newPlayer` using the
`structuredClone` method.

<codeblock language="javascript" type="exercise" testMode="fixedInput" matchSolutionCode="true">
<code>
const player = {
  name: "Messi",
  age: 36,
  address: {
    street: "123 Main St",
    city: "Miami",
    state: "Florida"
  }
};
// Write code here

console.log(newPlayer);
</code>
<solution>
const player = {
  name: "Messi",
  age: 36,
  address: {
    street: "123 Main St",
    city: "Miami",
    state: "Florida"
  }
};
// Write code here
const newPlayer = structuredClone(player);
console.log(newPlayer);
</solution>
</codeblock>
