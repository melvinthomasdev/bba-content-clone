`apply()` allows us to use
a function on an object
even when that function
is not defined inside that object.

The difference between `call`
and
`apply` is that `apply`
will accept all the arguments
in the form of an array,
whereas you can pass
arguments in the `call`
method simply as a list
of values separated by commas.

<Editor lang="javascript">
<code>
let firstPerson = {name: "Sam"};
let secondPerson = {name: "Oliver"};

function personIntro(greetings, details) {
  console.log(greetings + this.name + ". " + details);
}

personIntro.apply(firstPerson, ["Hello! I am ", "I am 23 years old."]);
personIntro.apply(secondPerson, ["Hello! I am ", "I am 12 years old."]);
</code>
</Editor>



In the example given above,
when we use `apply()`
with `firstPerson`,
the value of `this.name` is **Sam**.

The value of `this.name` changes to
**Oliver** when we use
the `apply()` method with `secondPerson`.