`isNaN()` method checks
whether a value is **NaN**
when converted to
a number.

- The method accepts
a parameter and tries
to convert it into
a number.
- The method
gives an output **true**
if the converted value is
**NaN**, and **false**
if it is **not NaN**.

Now consider the following examples:
<codeblock language="javascript" type="lesson">
<code>
console.log(isNaN("Good Morning!"));

const string = "Hello!";
console.log(string, isNaN(string));

console.log(`"2"`, isNaN("2"));

console.log(`false`, isNaN(false));

console.log(`0`, isNaN(0));

console.log(`""`, isNaN(""));
</code>
</codeblock>

In JavaScript, when we convert 
`""`, `true` and `false` to number,
we get 0, 1 and 0 respectively.
Since these are numbers,
`isNaN` gives **false** as an output.

We will be learning how to
convert a value to a Number
in an upcoming chapter.
