An anonymous function is one 
that is not given a name.

Here's an anonymous function created 
usig the `function` keyword:
<codeblock language="javascript" type="lesson">
<code>
function () {
  console.log("Function Keyword");
}
</code>
</codeblock>

The code above gives us an error 
which means that we cannot do 
something like this using the `function` 
keyword.

Let's try the same thing with 
an arrow function:
<codeblock language="javascript" type="lesson">
<code>
() => {
  console.log("Arrow Function");
}
</code>
</codeblock>

The code above does not result in an 
error. But there is a problem 
with both these ways to define 
a function. How do we run a function that
does not have a name?

Take a look at this:

<codeblock language="javascript" type="lesson">
<code>
// Run the function defined with the function keyword without saving it in a variable

(function () {
  console.log("Function Keyword");
})();

// Run the arrow function without saving it in a variable
(() => {
  console.log("Arrow Function");
})();
</code>
</codeblock>

This is interesting! We are running these functions 
as soon as we define the functionality. So, this can be 
done. But what about running any of these functions later?

Unless we save the functionality 
in a variable, there is no way 
that we can run it later. 
