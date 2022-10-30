Follow the steps given below
to write a program:

1. Create a **trees** array
and
store the following elements in it:
`pine`, `banyan` and `rosewood`.

2. Create a variable **count**
and initialize it with the value `0`.

3. Use the `while` loop to
check whether the value of
**count** is less than
the number of elements
in the **trees** array.

4. If the `while` loop returns `true`,
use `console.log` to show
all the elements of the array.

5. To avoid creating an infinite loop,
increment the value of **count**
after every iteration.
 
<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let trees = ["pine", "banyan", "rosewood"];
let count = 0;

while(count < trees.length) {
  console.log(trees[count]);
  count++;
}
</solution>
</Editor>