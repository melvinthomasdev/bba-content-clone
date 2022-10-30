Use `Object.values()` to
get all the **values** stored
in the `bird` object.

Use `console.log` to show the values.

<Editor lang="javascript" type="exercise">
<code>
let bird = {
  type: "sparrow",
  canFly: true,
  claws: 4
};

console.log();
</code>

<solution>
let bird = {
  type: "sparrow",
  canFly: true,
  claws: 4
};

console.log(Object.values(bird));
</solution>
</Editor>