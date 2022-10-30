Overwrite the value of the **claws** property
to **5** using the `Object.assign` method.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  canFly: true,
  claws: 4
};

Object.assign();
console.log(bird);
</code>

<solution>
let bird = {
  name: "Sparrow",
  canFly: true,
  claws: 4
};

Object.assign(bird, { claws: 5 });
console.log(bird);
</solution>
</Editor>