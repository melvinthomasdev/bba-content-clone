The object that the `this` keyword refers to
does not depend on where the method is defined.
It only depends on the object that invokes the
function it is used in.

In the example below,
`this` is used inside a function definition.
The function is then assigned to
two different objects.

<codeblock language="javascript" type="lesson">
<code>
function displayName () {
  console.log(`Hello, I'm ${this.name}`)
};

const admin = {
  name: "Adam Smith",
  age: 45,
  displayGreeting: displayName,
}

const user = {
  name: "Sam Smith",
  age: 32,
  displayGreeting: displayName,
}

const guest = {
  name: "Oliver Smith",
  age: 29,
  greeting: {
    name: "Guest",
    displayGreeting: displayName,
  }
}

admin.displayGreeting();
user.displayGreeting();
guest.greeting.displayGreeting();
</code>
</codeblock>

In the example above:

- When `admin.displayGreeting()` is invoked,
`this` refers to `admin`.

- When `user.displayGreeting()` is invoked,
the value of `this` is `user`.

- When `guest.greeting.displayGreeting()` is invoked,
the value of `this` is `guest.greeting`.
