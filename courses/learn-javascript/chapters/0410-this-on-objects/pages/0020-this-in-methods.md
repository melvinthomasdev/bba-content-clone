Consider the following example.

<codeblock language="javascript" type="lesson">
<code>
const admin = {
  name: "Adam Smith",
  age: 45,
  displayGreeting () {
    console.log(`Hello, I'm ${this.name}`);
  },
}

admin.displayGreeting();
</code>
</codeblock>

In the example give above,
the `this` keyword refers to
the `admin` object.
That is why we get the value of `admin.name`,
i.e., **"Adam Smith"**, in the output.

`this` keyword refers to the object that
invoked the function it is used in.
In the example given above,
that object is `admin`.

The object to which the `this` keyword
refers to depends on where
`this` is being used.
In this chapter,
we saw how `this` behaves inside
an object's method that is defined using
traditional function definition.
