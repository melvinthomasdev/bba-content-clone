Declare an arrow function inside the
`message` function.
Use `this` inside the arrow function
to access the `bird.message()` method.

Use the `console.log` statement inside
the arrow function to show the message
**Bird name: Sparrow**.

<Editor type="exercise" lang="javascript">
<code>
let bird = {
  name: "Sparrow",
  message() {

  }
}

bird.message();
</code>

<solution>
let bird = {
  name: "Sparrow",
  message() {
    let arrowFunction = () => console.log(`Bird name: ${this.name}`);
    arrowFunction();
  }
}

bird.message();
</solution>
</Editor>