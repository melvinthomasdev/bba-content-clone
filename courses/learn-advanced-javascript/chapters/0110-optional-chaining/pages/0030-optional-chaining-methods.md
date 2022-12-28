Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user1 = {
  name: "Sam Smith",
  showGreeting() {
    console.log(`I am ${this.name}`);
  }
};

const user2 = {
  name: "Adam Smith",
};

user1.showGreeting();
user2.showGreeting();
</code>
</codeblock>

The example given above,
throws an error because
`user2` does not have
a method `showGreeting`.

Optional chaining `?.` can also
be used to invoke the method
of an object after checking that
the method exists.

<codeblock language="javascript" type="lesson">
<code>
const user1 = {
  name: "Sam Smith",
  showGreeting() {
    console.log(`I am ${this.name}`);
  }
};

const user2 = {
  name: "Adam Smith",
};

user1.showGreeting?.();
user2.showGreeting?.();
</code>
</codeblock>

In the example given above:

- `user1.showGreeting?.()` invokes the
  `showGreeting` method of `user1`
  only if `user1` has a method `showGreeting`.
  Since, `user1` has a method `showGreeting`,
  it is invoked.

- `user2.showGreeting?.()` invokes the
  `showGreeting` method of `user2`
  only if `user2` has a method `showGreeting`.
  Since, `user2` does not
  have a method `showGreeting`,
  nothing is invoked.
