Follow the steps given below
to write a program:

1. Create a variable `userCategory`
and
store the string **Paid**.

2. Use NOT, `!`
in the `if` statement.
The program should
show the message
**Please make payment!**
when the **userCategory**
does not store
the string **Paid**.

3. Use the `else` statement
to show the message
**You can access premium content!**.

<Editor lang="javascript" type="exercise">
<code>
// Write your code here.
</code>

<solution>
let userCategory = "Paid";

if(!(userCategory == "Paid")) {

  console.log("Please make payment!");

} else {

  console.log("You can access premium content!");

}
</solution>
</Editor>