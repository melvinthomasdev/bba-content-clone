Use optional chaining `?.`
to access the `bird.details.canFly`
property.

Use `console.log` to show the result.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  details: {
    claws: 4,
    canFly: true
  }
}

console.log();
</code>

<solution>
let bird = {
  name: "Sparrow",
  details: {
    claws: 4,
    canFly: true
  }
}

console.log(bird?.details?.canFly);
</solution>
</Editor>