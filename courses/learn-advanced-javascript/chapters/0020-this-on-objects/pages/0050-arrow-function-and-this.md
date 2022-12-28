`this` works differently inside an arrow function.

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

In the example given above,
the value of `this.fullName` is `undefined`.
When used inside an arrow function method,
`this` does not refer to the object that invokes
the function it is used in, i.e., `admin`.
To understand what `this` refers to,
when used inside an arrow function,
let's take a look at another example.

<codeblock language="javascript" type="lesson">
<code>
const admin = {
  fullName: "Adam Smith",
  age: 45,
  displayGreeting() {
    const user = {
      fullName: "Oliver Smith",
      displayAdminGreeting: () => console.log(`Hello, I'm ${this.fullName}`),
    }
    user.displayAdminGreeting();
  },
}

admin.displayGreeting();
</code>
</codeblock>

In the example given above,
`admin.displayGreeting()` invokes
`user.displayAdminGreeting()`
which contains the `this` keyword.
The `this` keyword refers to the object `admin`
that invoked the function `displayGreeting`
that invoked the method `displayAdminGreeting`
it is used in.

Let's take a look at the example
from the beginning of the chapter.

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

In the example above,
the `this` keyword refers to the `window` object.
The `window` object represents the browser window
in which the script is running.
The `window` object has no property `fullName`.
Hence we get the output **"Hello, I'm undefined"**.

Let's assign a value to the `fullName` property of
the `window` object.

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

In the example given below,
we have an arrow function method
that belongs to an object
nested inside another arrow function method.
It also gives the same output as
the example given above.

<codeblock language="javascript" type="lesson">
<code>
window.fullName = "Sam Smith";

const admin = {
  fullName: "Adam Smith",
  age: 45,
  displayGreeting: () => {
    const user = {
      fullName: "Oliver Smith",
      displayAdminGreeting: () => console.log(`Hello, I'm ${this.fullName}`),
    }
    user.displayAdminGreeting();
  },
}

admin.displayGreeting();
</code>
</codeblock>