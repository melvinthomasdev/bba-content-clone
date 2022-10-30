Use optional chaining `?.`
to delete the
**claws** property of
the **bird** object.

Use `console.log`
to show the **bird** object.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  claws: 4
};

console.log(bird);
</code>

<solution>
let bird = {
  name: "Sparrow",
  claws: 4
}

delete bird?.claws;
console.log(bird);
</solution>
</Editor>