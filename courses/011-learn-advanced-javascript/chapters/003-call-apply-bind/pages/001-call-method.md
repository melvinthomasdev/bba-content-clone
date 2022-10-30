​
We can use a function
defined inside an object
to utilize the other properties
defined in that object.
But how would we add a common
function to all
the objects that need it?

For example,
it doesn't make sense
to define a `jump` function
inside a **cat** object
and
then define the same function
inside a **rabbit** object.
For this,
it's better to use the
`call` function.

`call()` allows us to use
a function on an object
even when that function
is not defined inside that object.

<Editor lang="javascript">
<code>
let firstPerson = {name: "Sam"};
let secondPerson = {name: "Oliver"};

function personIntro(greetings, hobbies) {
  console.log(greetings + " " + this.name + ". " + hobbies);
}

personIntro.call(firstPerson, "Hello! I am", "I like gardening");
personIntro.call(secondPerson, "Hello! I am", "I like painting");
</code>
</Editor>In the example given above,
when we use `call()`
with the object `firstPerson`,
the value of `this.name` is **Sam**.

The value of `this.name`
changes to **Oliver**
when we use `call()`
with the object `secondPerson`.