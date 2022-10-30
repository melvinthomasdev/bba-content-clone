Update the properties of the `bird` object,
as per the table below.

Use **dot notation** to update the object.

| Key    | Value |
| ------ | ----- |
| canFly | false |
| claws  | 3     |

<Editor lang="javascript" type="exercise">
<code>
let bird = {
  type: "sparrow",
  canFly: true,
  claws: 5
};

console.log(bird);
</code>

<solution>
let bird = {
  type: "sparrow",
  canFly: true,
  claws: 5
};

bird.canFly = false;
bird.claws = 3;

console.log(bird);
</solution>
</Editor>