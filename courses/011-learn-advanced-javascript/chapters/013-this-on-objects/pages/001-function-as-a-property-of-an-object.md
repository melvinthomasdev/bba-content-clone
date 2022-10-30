We can store a function as
a property of an object.
These functions are called
**methods**.

In the example given below,
we are creating the function
and
assigning it to the
property **sayHello**.
Essentially, `sayHello` is now a
method of the **admin** object.

<Editor lang="javascript">
<code>
let admin = {
  name: "Adam Smith",
  age: 45,
}

admin.sayHello =  function() {
  console.log("Hello World");
}

admin.sayHello();
</code>
</Editor>

We can also declare a function
before assigning it to a property.

<Editor lang="javascript">
<code>
let admin = {
  name: "Adam Smith",
  age: 45,
}

function sayHello() {
  console.log("Hello World");
}

admin.greetings = sayHello;

admin.greetings();
</code>
</Editor>

In the example given above,
we first declare the **sayHello** function.
Then we assign it to the
**greetings** property.