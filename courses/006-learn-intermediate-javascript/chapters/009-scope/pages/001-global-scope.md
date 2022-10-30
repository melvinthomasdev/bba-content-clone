To be able to access
any variable, we need to
ensure that it is accessible to us.
The accessibility of a
variable is determined by scope.

Broadly speaking,
**Global Scope** and **Local Scope**
are the two kinds of scope in JavaScript.

A variable that is outside
any function or a code block `{...}`
in the program is in the global scope.

Such variables are called **global variables**.
A JavaScript document can have only one global scope
that contains all the other local scopes inside it.

<Editor lang="javascript">
<code>
let name = "Oliver";

function showAge() {
  let age = 30;
}

let hobby = "Writing";

console.log(name);
console.log(hobby);
console.log(age);
</code>
</Editor>

In the example given above,
`name` and `hobby` are global variables
since they are outside any function
or code block `{...}` in the program.
We can access a global variable from
anywhere within the global scope.
Therefore,
the first two `console.log` statements
can print values in the output.

However, `age` is inside the `showAge` function.
It does not belong to the global scope.
It instead belongs to the **local scope** of the function `showAge`.
Therefore, we can not access its value
using the third `console.log` statement.
