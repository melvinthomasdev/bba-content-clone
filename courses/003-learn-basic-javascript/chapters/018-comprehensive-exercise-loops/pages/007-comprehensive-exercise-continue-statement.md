Follow the steps given below
to write a program:

1. Create a **places** array
and
store the following elements in it:
`London`, `New York`, `Delhi`, `Rome`, `Paris` and `Tokyo`.

2. Use the `for` loop to
access all the elements
of the **places** array.

3. Use the `continue` statement inside
an `if` statement such that it skips
the elements in the **even** indices.

4. Use `console.log` to show
the elements in the **odd** indices.

<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let places = ["London", "New York", "Delhi", "Rome", "Paris", "Tokyo"];

for(let count = 0; count < places.length; count++) {
  if(count % 2 == 0) {
    continue;
  }
  console.log(places[count]);
}
</solution>
</Editor>