Create a deep clone of `bird`
and
assign it to `updatedBird`.
Also, modify the value of
`updatedBird.claws` to `5`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird = {
  name: "Sparrow",
  canFly: true,
  claws: 4,
};

const updatedBird = ;

console.log(updatedBird);
</code>

<solution>
const bird = {
  name: "Sparrow",
  canFly: true,
  claws: 4,
};

const updatedBird = {
  ...bird,
  claws: 5,
};

console.log(updatedBird);
</solution>
</codeblock>