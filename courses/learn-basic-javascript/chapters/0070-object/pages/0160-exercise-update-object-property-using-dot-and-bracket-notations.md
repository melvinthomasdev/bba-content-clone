Update the properties of the `bird` object,
as per the table given below.

Use bracket notation to update the object
only where it's necessary.

| Key               | Value |
| ----------------- | ----- |
| canFly            | false |
| "number-of-claws" | 3     |

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const bird = {
  type: "sparrow",
  canFly: true,
  "number-of-claws": 5
};

console.log(bird);
</code>

<solution>
const bird = {
  type: "sparrow",
  canFly: true,
  "number-of-claws": 5
};

bird.canFly = false;
bird["number-of-claws"] = 3;

console.log(bird);
</solution>
</codeblock>