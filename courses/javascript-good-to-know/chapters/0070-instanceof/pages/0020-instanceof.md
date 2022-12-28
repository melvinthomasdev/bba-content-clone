Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
class User {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
};

const admin = new User("Sam Smith", 32);
console.log(admin);
</code>
</codeblock>

In the example given above,
`admin` is an instance of `User`.
We can confirm that by using `instanceof`,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
class User {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
};

const admin = new User("Sam Smith", 32);
console.log(admin);

console.log(admin instanceof User);

const member = {
  name: "Oliver Smith",
  age: 21,
};

console.log(member instanceof User)
</code>
</codeblock>

In the example given above:

- Since `admin` is an instance
  of the `User` class,
  `admin instanceof User`
  evaluates to `true`.

- Another object `member` was defined
  with the `name` and `age` properties.
  Since `member` is not an instance
  of the `User` class,
  `member instanceof User`
  evaluates to `false`.
