Let's look at the example given below:

<Editor lang="javascript">
<code>
function printFruits(first, second) {
  console.log("First: " + first);
  console.log("Second: " + second);
}

printFruits('Apple', 'Mango', 'Banana', 'Guava', 'Cherry');
</code>
</Editor>

Notice that we are passing 5 values in the function when we are executing it. But the function can only take 2 values as shown in its definition.

As you can see, a function can execute even when the number of arguments is more than the number of parameters. It does not result in an error. The extra arguments are simply ignored.

Now, run this code:

<Editor lang="javascript">
<code>
function printFruits(first, second, ...others) {
  console.log("First: " + first);
  console.log("Second: " + second);
  console.log("Others: " + others);
}

printFruits('Apple', 'Mango', 'Banana', 'Guava', 'Cherry');
</code>
</Editor>

The `...` is the rest operator. A function with the **rest parameter** `...`, can accept any number of arguments. The extra arguments are stored as an array.

Since we want to store all the remaining arguments in the rest parameter, there can be only one rest parameter and it has to be the last parameter in a function.