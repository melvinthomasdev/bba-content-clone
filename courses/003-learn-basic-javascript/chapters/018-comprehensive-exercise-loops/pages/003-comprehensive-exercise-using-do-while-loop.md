Follow the steps given below
to write a program:

1. Create a **admins** array
and
store the following elements in it:
`Sam`, `Adam` and `Eve`.

2. Create a variable **count**
and initialize it with the value `0`.

3. Use the `do...while` loop
such that the code block inside
`do` shows the first element
of the **admins** array
without any checks.

4. After the first iteration,
the condition in the `while`
statement is checked to
show all the elements of
the **admins** array
using `console.log`.

5. To avoid creating an infinite loop,
increment the value of **count**
after every iteration.

<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let admins = ["Sam", "Adam", "Eve"];
let count = 0;

do {
  console.log(admins[count]);
  count++;
} while(count < admins.length);
</solution>
</Editor>