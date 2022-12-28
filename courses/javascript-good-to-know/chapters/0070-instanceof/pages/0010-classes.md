Classes are templates
that can be used
to create objects.
An object created using a class
is known as an **instance**
of that class.
A class is created
as shown in the example below:

<codeblock language="javascript" type="lesson">
<code>
class User {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}
</code>
</codeblock>

In the example given above,
we defined a class `User`.
Inside the code block
of the `User` class,
there is a function `constructor`.
The constructor function is invoked
whenever a class instance is created,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
class User {
  constructor(name, age) {
    console.log("This is from the constructor");
    this.name = name;
    this.age = age;
  }
};

const admin = new User("Sam Smith", 32);
console.log(admin);
</code>
</codeblock>

In the example given above:

- We created an instance `admin`
  of the `User` class
  using the `new` keyword.

- Whenever `new User()` is executed,
  the `constructor` function of `User`
  will be invoked.
  The arguments passed inside
  the parentheses in `new User()`,
  get passed to the `constructor` function
  inside the `User` class.

- Inside the `constructor` function
  of the `User` class,
  we first display
  **"This is from the constructor"**
  using `console.log`
  to demonstrate that the
  `constructor` function is invoked
  whenever `new User()` is executed.

- Then we assign the value of
  the `name` parameter to `this.name`
  and
  we assign the value of
  the `age` parameter to `this.age`.
  What this does is,
  it creates the properties
  `name` and `age` in the instance
  that was created.
  Hence the value `"Sam Smith"` gets
  assigned to `admin.name`
  and
  the value `32` gets
  assigned to `admin.age`.
