Use `Object.keys()` to
get all the **keys** stored
in the `bird` object.

Use `console.log` to show the keys.

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

console.log(Object.keys(bird));
</solution>
</Editor>