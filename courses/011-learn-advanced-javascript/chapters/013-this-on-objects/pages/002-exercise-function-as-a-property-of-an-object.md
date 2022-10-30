Create a function **canFly** and
store it as a method of the **bird**
object.

Use `console.log` inside the method
to display the message, **Yes I can fly**.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  claws: 4
}


bird.canFly();
</code>

<solution>
let bird = {
  name: "Sparrow",
  claws: 4
}

bird.canFly = function() {
  console.log("Yes I can fly");
}

bird.canFly();
</solution>
</Editor>