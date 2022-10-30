Follow the steps given below
to write a program:

1. Create a **places** array
and
store the following elements in it:
`London`, `New York`, `Delhi`, `Rome`, `Paris` and `Tokyo`.

2. Use the `for` loop to
access all the elements
of the **places** array.

3. Use the `break` statement inside
an `if` statement such that it skips
the elements that come after the index **4**.

4. Use `console.log` to show
the elements in the indices that come
before the index **4**.

<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let places = ["London", "New York", "Delhi", "Rome", "Paris", "Tokyo"];

for(let count = 0; count < places.length; count++) {
  if(count == 4) {
    break;
  }
  console.log(places[count]);
}
</solution>
</Editor>