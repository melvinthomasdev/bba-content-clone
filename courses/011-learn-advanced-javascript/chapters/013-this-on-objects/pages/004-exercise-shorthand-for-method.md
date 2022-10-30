Declare a function inside
the **bird** object
and
assign it directly to the
**canFly** property. Try not
to use the **function** keyword
to do this.

Use `console.log` inside the function
to display the message **Yes I can fly**.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  claws: 4,

}

bird.canFly();
</code>

<solution>
let bird = {
  name: "Sparrow",
  claws: 4,
  canFly() {
    console.log("Yes I can fly");
  }
}

bird.canFly();
</solution>
</Editor>