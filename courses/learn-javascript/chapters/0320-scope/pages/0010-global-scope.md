The accessibility of a variable is determined by its scope.
Broadly speaking,
**Global Scope** and **Local Scope**
are the two kinds of scope in JavaScript.

A variable that is outside any function or
a code block in the program is in the **global scope**.
Such a variable is called a **global variable**.
A JavaScript document can have only one global scope.

<codeblock language="javascript" type="lesson">
<code>
const name = "Oliver";

const showAge = () => {
  const age = 30;
}

const hobby = "Writing";

console.log(name);
console.log(hobby);
console.log(age); // Will result in error
</code>
</codeblock>

In the example given above,
`name` and `hobby` are global variables
since they are outside any function
or code block in the program.
We can access a global variable from
anywhere within the script.
Therefore,
the first two `console.log` statements
can print values in the output.

However, `age` is inside the `showAge` function.
It does not belong to the global scope.
It instead belongs to the **local scope** of the function `showAge`.
That is why we were not able to access `age` in the third `console.log` statement.

Do note that,
we can also access `name` within the `showAge` function.

<codeblock language="javascript" type="lesson">
<code>
const name = "Oliver";

const showAge = () => {
  const age = 30;

  console.log(name);
  console.log(age);
  console.log(hobby); // Will result in error
}

showAge();

const hobby = "Writing";
</code>
</codeblock>

In the above example,
we cannot access `hobby` in `showAge` because
`hobby` is defined after `showAge` is defined.
