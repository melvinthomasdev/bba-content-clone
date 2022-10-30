We can declare a function
inside an object
and directly assign it
to a property.

In the example given below,
we are declaring the function
inside the **admin** object
and assigning it to the
**sayHello** property.

<Editor lang="javascript">
<code>
let admin = {
  name: "Adam Smith",
  age: 45,
  sayHello: function() {
    console.log("Hello everyone");
  }
}

admin.sayHello();
</code>
</Editor>

Inside the method, while declaring a
function, we can choose not to
write the word **function**.

<Editor lang="javascript">
<code>
let admin = {
  name: "Adam Smith",
  age: 45,
  sayHello() {
    console.log("Hello everyone");
  }
}

admin.sayHello();
</code>
</Editor>

In the example given above,
we are creating the
**sayHello** method
using a shorter syntax.