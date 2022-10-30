Arrow functions do not have their own `this`.
If we use `this` inside an arrow function,
it takes the value from the outer scope.

In the example given below,
`this` inside **arrowFunction**
takes the value from the
outer `admin.sayHello()` method.

<Editor lang="javascript">
<code>
let admin = {
  name: "Adam Smith",
  age: 45,

  sayHello() {
    let arrowFunction = () => console.log(`Hello ${this.name}`);
    arrowFunction();
  }
}

admin.sayHello();
</code>
</Editor>