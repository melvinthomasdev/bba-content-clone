Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
const admin = {
  fullName: "Adam Smith",
  age: 45,
  displayGreeting: function () {
    console.log(`Hello, I'm ${this.fullName}`)
  },
}

admin.displayGreeting();
</code>
</codeblock>

`this` works differently inside an arrow function.
Let's update the code above to use an arrow function
instead of a regular function:

<codeblock language="javascript" type="lesson">
<code>
const admin = {
  fullName: "Adam Smith",
  age: 45,
  displayGreeting: () => console.log(`Hello, I'm ${this.fullName}`),
}

admin.displayGreeting();
</code>
</codeblock>


In the example given above, the value of `this.fullName` is `undefined`.
This is because, arrow functions do not have their own
`this` binding and capture the `this` value from the
surrounding context. If it doesn't find a `this`,
it will default to the global context. In the browser,
`this` will be the `window` object.
And the `fullName` property does not exist in the `window` object.

Let's add a `fullName` property to the `window` object, and assign it a value.

<codeblock language="javascript" type="lesson">
<code>
window.fullName = "Sam Smith";

const admin = {
  fullName: "Adam Smith",
  age: 45,
  displayGreeting: () => console.log(`Hello, I'm ${this.fullName}`),
}

admin.displayGreeting();
</code>
</codeblock>

"In the above code, in the arrow function method,
`this.fullName` refers to`window.fullName` which
we have defined as **Sam Smith**.
