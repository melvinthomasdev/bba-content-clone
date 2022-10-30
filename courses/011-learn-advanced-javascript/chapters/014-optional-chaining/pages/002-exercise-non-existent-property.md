Use conditional operator `?`
to access `bird.details.canFly` property.
You must return `undefined`
if the property is not present.

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

console.log(bird.details ? bird.details.canFly : undefined);
</solution>
</Editor>