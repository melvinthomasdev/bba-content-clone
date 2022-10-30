Sometimes the method needs
to access the object and other properties
of the object.

Look at the example given below:

<Editor lang="javascript">
<code>
let admin = {
  name: "Adam Smith",
  age: 45,
  sayHello() {
    console.log(`Hello ${admin.name}`);
  }
}

admin.sayHello();
</code>
</Editor>

We can access the values inside the
object itself using `admin.name`
or `admin.age`. This is how we can
access these values inside a method too
as shown in the example.

We have another approach to accessing
object properties inside methods: using
`this`.

<Editor lang="javascript">
<code>
let admin = {
  name: "Adam Smith",
  age: 45,
  sayHello() {
    console.log(`Hello ${this.name}`);
  }
}

admin.sayHello();
</code>
</Editor>

We didn't do anything new here. We have
simply replaced `admin.name` with
`this.name`.

The value of `this` is the object
that precedes the **dot operator**
during execution.

In this example, we say `admin.sayHello()`. So,
for the **sayHello** method, `this`
is **admin**.

Thus, when we use `this`
inside the method of an object,
it refers to that object.