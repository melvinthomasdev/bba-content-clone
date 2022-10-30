Update the properties of the `bird` object,
as per the table given below.

Use **bracket notation** to update the object.

| Key    | Value |
| ------ | ----- |
| "can fly" | false |
| claws  | 3     |

<Editor lang="javascript" type="exercise">
<code>
let bird = {
  type: "sparrow",
  "can fly": true,
  claws: 5
};

console.log(bird);
</code>

<solution>
let bird = {
  type: "sparrow",
  "can fly": true,
  claws: 5
};

bird["can fly"] = false;
bird["claws"] = 3;

console.log(bird);
</solution>
</Editor>