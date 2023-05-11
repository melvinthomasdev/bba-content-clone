`isNaN()` method is used
to check if a value is
`NaN`.

Let us take a look at an
example.

<codeblock language="javascript" type="lesson">
<code>
const number = 2;

console.log(isNaN(number));
</code>
</codeblock>

In the above code, we can
see that `isNaN()` accepts
one parameter, checks if that
value is not a number, and
provides a an output.

Output will be Boolean **false**
if the value is of the data-type
**Number**, and **true** if
the value is of any other
data-type.

Syntax of using `isNaN()` is as
follows:
`isNaN(value)`

Let us take a look at another
example.

<codeblock language="javascript" type="lesson">
<code>
// Checking a variable storing string value
const string = "Hello!";
console.log(isNaN(string));

// Passing a string directly to the method
console.log(isNaN("Good Morning!"));

// Checking a number wrapped in a string
console.log(isNaN("2"));
</code>
</codeblock>
