In JavaScript,
the value of `this` does not depend on
where the method is defined.

Instead, it depends on the object that precedes
the **dot operator** during execution.

In the example given below,
we assign `this` to two different
objects.

<Editor lang="javascript">
<code>
let admin = {
  name: "Adam Smith",
  age: 45,
}

let user = {
  name: "Sam Smith",
  age: 32
}

function sayHello() {
  console.log(`Hello ${this.name}`);
}

admin.greetings = sayHello;
user.greetings = sayHello;

admin.greetings();
user.greetings();
</code>
</Editor>

Here, when `admin.greetings()` executes,
the value of `this` is `admin`
and
when `user.greetings()` executes,
the value of `this` is `user`.