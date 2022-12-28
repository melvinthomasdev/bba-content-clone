`apply()` method,
just like `call()`
is used to invoke a function
and
provide an object for the `this` keyword
used inside the function to refer to.

The `apply()` method accepts two arguments.

- The object for the `this` keyword
used inside the function invoked to refer to.

- An array of elements that will be passed
as arguments to the function invoked.

<codeblock language="javascript" type="lesson">
<code>
const admin = { name: "Adam Smith" };
const user = { name: "Oliver Smith" };

function displayIntro(greetings, details) {
  console.log(`${greetings} I am ${this.name}. ${details}`);
}

displayIntro.apply(admin, ["Hi.", "I am the admin."]);
displayIntro.apply(user, ["Hello!", "I am 23 years old."]);
</code>
</codeblock>

In the example given above:

- `displayIntro.apply(admin, ["Hi.", "I am the admin."])`

  This invokes the `displayIntro` function,
  where the `this` keyword refers to `admin`.
  The two arguments passed to the function are
  `"Hi."` and `"I am the admin."`.

- `displayIntro.apply(user, ["Hello!", "I am 23 years old."])`

  This invokes the `displayIntro` function,
  where the `this` keyword refers to `user`.
  The two arguments passed to the function are
  `"Hello!"` and `"I am 23 years old."`.

Let's compare how we can invoke `displayIntro`
from the example above
with both `call()` and `apply()` methods.

<codeblock language="javascript" type="lesson">
<code>
const user = { name: "Oliver Smith" };

function displayIntro(greetings, details) {
  console.log(`${greetings} I am ${this.name}. ${details}`);
}

displayIntro.call(user, "Hello!", "I am 23 years old.");
displayIntro.apply(user, ["Hello!", "I am 23 years old."]);
</code>
</codeblock>