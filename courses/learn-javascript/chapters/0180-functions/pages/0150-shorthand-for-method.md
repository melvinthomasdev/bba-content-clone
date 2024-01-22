We can define methods directly
inside an object's definition.

<codeblock language="javascript" type="lesson">
<code>
const admin = {
  name: "Adam Smith",
  age: 45,
  displayGreeting: () => console.log("Hello everyone"),
}

admin.displayGreeting();
</code>
</codeblock>

In the example given above,
we are defining the method `displayGreeting`
directly inside the **admin** object.

Defining object methods using arrow functions
should always be preferred.
However, there are cases where we need to use
traditional function definitions
to define object methods.
There are two ways to do that.

<codeblock language="javascript" type="lesson">
<code>
const admin = {
  name: "Adam Smith",
  age: 45,
  displayGreeting: function () {
    console.log("Hello everyone");
  }
}

admin.displayGreeting();
</code>
</codeblock>

We can also use the object property shorthand
to define object methods.

<codeblock language="javascript" type="lesson">
<code>
const name = "Adam Smith";
const age = 45;
const displayGreeting = () => console.log("Hello everyone");

const admin = { name, age, displayGreeting };

admin.displayGreeting();
console.log(`I am ${admin.name}`);
</code>
</codeblock>