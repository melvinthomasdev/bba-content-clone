Let's look at an example:

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

In the example given above, the arrow function
within `displayAdminGreeting` captures its `this`
value from the `admin` object.
Arrow functions do not have their own `this` binding,
so they look up to the closest surrounding context,
which in this case is the `displayGreeting` method
of the `admin` object, where it finds the `fullName` property.
