Add the properties given
in the table below to
the `bird` object.

Use **dot notation** to add the properties.

| Key    | Value |
| ------ | ----- |
| canFly | true  |
| claws  | 4     |

<Editor lang="javascript" type="exercise">
<code>
let bird = {
  type: "sparrow"
};

console.log(bird);
</code>

<solution>
let bird = {
  type: "sparrow"
};

bird.canFly = true;
bird.claws = 4;

console.log(bird);
</solution>
</Editor>