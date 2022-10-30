Sometimes, we want to execute
a function as soon as it is defined.
For these purposes, we can use **IIFE**
which is an Immediately Invoked
Function Expression.

The variables declared
inside cannot be accessed
from outside the IIFE.

<Editor lang="javascript">
<code>
(function() {
  let message = "Hello, I am Sam Smith";
  console.log(message);
})();
</code>
</Editor>

You can also execute the function expression
as shown in the example below.
The location of the executing parentheses
does not change the output.

<Editor lang="javascript">
<code>
(function() {
  let message = "Hello, I am Sam Smith";
  console.log(message);
}());
</code>
</Editor>