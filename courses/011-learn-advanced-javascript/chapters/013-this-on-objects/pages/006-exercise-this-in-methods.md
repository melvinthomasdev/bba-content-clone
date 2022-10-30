Use the `this` keyword to
access the **bird** object,
such that the `console.log` statement
inside the function displays the message,
**A Sparrow can fly**.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  claws: 4,
  canFly() {
    console.log(`A ... can fly`);
  }
}

bird.canFly();
</code>

<solution>
let bird = {
  name: "Sparrow",
  claws: 4,
  canFly() {
    console.log(`A ${this.name} can fly`);
  }
}

bird.canFly();
</solution>
</Editor>