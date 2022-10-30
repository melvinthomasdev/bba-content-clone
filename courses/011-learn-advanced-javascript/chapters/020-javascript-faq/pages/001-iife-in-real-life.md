**What are uses of IIFE**
**in real life**
**?**

JavaScript supported only
the `var` keyword
before the introduction of
the `let`
and
the `const` keywords.
The variables declared using `var`
can accidentally become global variables
if there is no function to enclose it. 

<Editor lang="javascript">
<code>
if (true) {
  var message = "Welcome";
  console.log(message);
};

console.log(message);
</code>
</Editor>

In the example given above,
we declare the `message` variable
using the `var` keyword.
This variable
becomes a global variable
as there is no
function to enclose it.
Therefore, it can be accessed from
outside the `if` statement
and
the second `console.log` statement
can show the output.

We can use IIFE to prevent
an accidental declaration of global variables.

<Editor lang="javascript">
<code>
(function(){
  if (true) {
    var message = "Welcome";
    console.log(message);
  };
})()
console.log(message);
</code>
</Editor>

In the example given above,
we are enclosing the `message` variable
within an IIFE.
Now we can not access it from
the outside.
Thus the second `console.log`
statement gives an error.
You can use the `let` and `const` keywords
to remedy the above situation.
However, in case you are running
your JavaScript code in
an environment that does not
support the `let` and the `const` keywords,
IIFE comes in handy.

In addition to the above use case,
we can not always use `let`
and
`const`
as a replacement for IIFE.
Sometimes we need to show
an updated value every time
the function executes,
keeping the variable inaccessible
from outside the IIFE.

<Editor lang="javascript">
<code>
const myCounter = (function () {
  let count = 0;
  return function () {
    count++;
    return count;
  };
})();
console.log(myCounter());
console.log(myCounter());
console.log(myCounter());
console.log(myCounter());
</code>
</Editor>

In the example given above,
the value of the `count` variable
increments every time the function executes.
The function inside the IIFE
returns the value of the `count` variable.
Only the function that we are returning
from inside the IIFE can access the `count` variable.
