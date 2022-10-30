​
When we need a function to be
associated with a particular object,
we can use the `bind` method.
It will create a new function
and
will make sure that this
function picks the `this`
value from our object.

This way,
we get the functionality
associated with our object of choice
without having to execute the
function right away as in the case
of `call` or `apply`.

<Editor lang="javascript">
<code>
let firstPerson = {name: "Sam"};
let secondPerson = {name: "Oliver"};

function personIntro(greetings, details) {
  console.log(greetings + " " + this.name + ". " + details);
}

let firstPersonIntro = personIntro.bind(firstPerson);
firstPersonIntro("Hello! I am", "I like gardening");

let secondPersonIntro = personIntro.bind(secondPerson);
secondPersonIntro("Hello! I am", "I like painting");
</code>
</Editor>In the example given above,
when the `bind()` method
has `firstPerson` as the argument,
the value of `this.name` is **Sam**.
The value of `this.name` is **Oliver**
when the argument changes to `secondPerson`.
