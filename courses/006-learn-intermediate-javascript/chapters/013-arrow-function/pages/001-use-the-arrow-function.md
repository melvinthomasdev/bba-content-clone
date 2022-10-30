In the example given below,
we define a function
to **add two numbers**:

<Editor lang="javascript">
<code>
let add = function(firstNumber, secondNumber) {
  let result = firstNumber + secondNumber;
  return result;
};
console.log(add(3, 5));
</code>
</Editor>

There is another way to create a function in
JavaScript. This type of function is called
an arrow function because of how it looks:

<Editor lang="javascript">
<code>
let add = (firstNumber, secondNumber) => {
  let result = firstNumber + secondNumber;
  return result;
};
console.log(add(3, 5));
</code>
</Editor>

If you compare the two styles, there isn't
much difference. This new style looks compact
to some people and it appeals to them. Here is
an even more compact way of writing the same
arrow function:

<Editor lang="javascript">
<code>
let add = (firstNumber, secondNumber) => firstNumber + secondNumber;
console.log(add(3, 5));
</code>
</Editor>

There are some benefits of using the arrow
function. Because of this, mostly you'll find
developers going with arrow functions.
You should read more about arrow functions
and their benefits before you make that choice.