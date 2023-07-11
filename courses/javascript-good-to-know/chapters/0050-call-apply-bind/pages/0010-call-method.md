Take a look at the following example
that has two objects `dog` and `wolf`.​

<codeblock language="javascript" type="lesson">
<code>
const dog = {
  name: "Dog",
  bark() {
    console.log(`${this.name} goes woof`);
  },
};

const wolf = {
  name: "Wolf",
  bark() {
    console.log(`${this.name} goes woof`);
  },
};

dog.bark();
wolf.bark();
</code>
</codeblock>

In the example above,
we have two objects with a function
that performs the same task -
display the sound made by the animal
represented in the object.

We can extract the `bark` function
and
invoke it by providing context
to the `this` keyword
using the `call()` method.

<codeblock language="javascript" type="lesson">
<code>
const dog = { name: "Dog" };

const wolf = { name: "Wolf" };

const bark = function () {
  console.log(`${this.name} goes woof`);
}

bark.call(dog);
bark.call(wolf);
</code>
</codeblock>

In the above example,
we invoke `bark` using the `call()` method.
We pass the object that the `this` keyword
inside the function should refer to
as an argument of the `call()` method.

We can pass arguments to the function
invoked by the `call()` method,
after the first argument of the `call()` method.

<codeblock language="javascript" type="lesson">
<code>
const user = { name: "Oliver Smith" };

const project = { name: "BB Academy" };

const displayGreeting = function (projectName) {
  console.log(`Hi, I am ${this.name}. I am working on ${projectName}`);
}

displayGreeting.call(user, project.name);
</code>
</codeblock>

In the example above,
`displayGreeting.call(user, project.name)`
passes two arguments.
The first argument `user`,
is the object that the `this` keyword
inside the `displayGreeting` function
will refer to.
The second argument `project.name`
will be passed to the `displayGreeting` function.
