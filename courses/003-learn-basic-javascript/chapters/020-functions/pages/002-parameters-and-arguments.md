The variables mentioned
in a function's parentheses `()`
are called its **parameters**.
When the function is run,
the actual values given
to the function
as input in the `()`
are called its **arguments**.

We can pass data
to a function
using a list
of parameters
in the parentheses `()`
separated by commas.

In the example given below,
the function `userInfo`
has takes two parameters `name`
and
`age`.
When we call the function we pass two arguments
**Sam**
and
**5**.

<Editor lang="javascript">
<code>
function userInfo(name, age) {
  console.log(name + " is " + age + " years old.");
}
userInfo("Sam", 5);
</code>
</Editor>

If a function has parameters
and
when running it, we do not
provide a matching number
of arguments,
then
the argument takes
`undefined` as the default value.

In the example given below,
the value of
`age`
is not given.
Therefore,
in the output
we get
`Sam is undefined years old.`.

<Editor lang="javascript">
<code>
function userInfo(name, age) {
  console.log(name + " is " + age + " years old.");
}
userInfo("Sam");
</code>
</Editor>

A missing argument
can sometimes
give us unexpected results.

In the example given below,
the second argument
is not given.
Therefore, we get
`NaN`
in the output
because
we are performing
addition of
an integer
and
`undefined`.

<Editor lang="javascript">
<code>
function add(firstNumber, secondNumber) {
  console.log(firstNumber + secondNumber);
}
add(3);
</code>
</Editor>

However,
we can avoid this error
by providing a default value.
The function uses
the default value
when the argument is missing.

In the example given below,
the second argument is missing.
Therefore,
the function
uses the default value
**0**
to perform the addition.

<Editor lang="javascript">
<code>
function add(firstNumber, secondNumber=0) {
  console.log(firstNumber + secondNumber);
}
add(3);
</code>
</Editor>