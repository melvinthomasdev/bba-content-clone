Let's look at another example:

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

In the above example, we created an arrow function inside another arrow function.
Then we try to log to the console, the value of `this.fullName`.
It doesn't have a `this` value, so it looks outside in its surrounding context.
This leads it to the outer arrow function, where again we don't have a `this` value.
It goes even further and looks to the window object.
There, it finds a `this` object and a `fullName` key on it.
