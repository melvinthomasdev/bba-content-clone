Use optional chaining with
square brackets `?.[]`
to access the **birdName**
property of the **bird** object.

Use `console.log` to show
the value of **birdName**.

<Editor type="exercise" lang="javascript">
<code>
let singingBird = "birdName";

let bird = {
  birdName: "Sparrow"
};

console.log();
</code>

<solution>
let singingBird = "birdName";

let bird = {
  birdName: "Sparrow"
};

console.log(bird?.[singingBird]);
</solution>
</Editor>