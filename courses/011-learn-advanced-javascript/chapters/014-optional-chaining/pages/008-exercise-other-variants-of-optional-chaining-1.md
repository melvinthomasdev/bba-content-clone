Use optional chaining `?.` to
execute the `canSing` function.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  canSing() {
    console.log("Yes, I can sing");
  }
};
</code>

<solution>
let bird = {
  name: "Sparrow",
  canSing() {
    console.log("Yes, I can sing");
  }
};

bird.canSing?.();
</solution>
</Editor>