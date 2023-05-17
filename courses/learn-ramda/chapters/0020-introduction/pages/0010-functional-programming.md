Functional programming is a programming approach where programs are constructed by applying and composing functions. It is a declarative style of programming. This means that we write code that specifies what we want to do, rather than saying how.

Let's try to understand this with an example. We want to get only the fruits whose character length is less than or equal to 6.

```js
const fruits = ["watermelon", "orange", "papaya", "strawberry"]

//Imperative style
let filteredFruits = [];
for (let i = 0; i < fruits.length; i++) {
   if (fruits[i].length <= 6) {
      filteredFruits.push(fruits[i]);
   }
};
```
This is imperative programming, where we write code specifying how we want something to be done. We can make it cleaner using the `forEach` method:
```js
let filteredFruits = [];
fruits.forEach(fruitName => {
  if (fruitName.length <= 6) filteredFruits.push(fruitName);
});
```
The code looks better now, but it's still not fully declarative. Let us rewrite it again, this time, using the `filter` method:
```js
//Declarative style
const filteredFruits = fruits.filter(fruitName => fruitName.length <= 6);
```

The code looks much simpler and cleaner now. This is declarative programming. Instead of writing code that specifies how we want to do something, we are specifying what we want the result to be. Functional programming follows the declarative approach.

The main condition of functional programming is that all our functions should be pure functions.

## Pure functions

**Pure functions** are those that do not have any side effects, don't mutate the input data and always give the same output for the same inputs. Let us see each of the above conditions with an example.

- Pure functions always give the same outputs for the same inputs. For example, consider the following function, it always returns the same output for the same values of `a` and `b`:
  ```js
  const add = (a, b) => a + b;
  ```

  In the below example, the function `multiply` is not a pure function since its output will be different for the same value of `a` if the value of `multiplyingFactor` changes.
  ```js
  let multiplyingFactor = 42;
  const multiply = a => multiplyingFactor * a;

  multiply(10); //=> returns 420

  multiplyingFactor = 30;

  multiply(10); //=> returns 300
  ```

- Pure functions do not mutate the input data. Let us see an example of such a case.

  Consider we have an object `user` whose address has to be updated. Here is one way of doing it:
  ```js
  const withAddress = (user, address) => {
    user.address = address
    return user;
  };
  ```

  This solution would change the input data i.e `user` object and return the changed value. This is called data mutation.

  If some other function is using the `user` object in its logic, it would get the changed data which could cause a lot of issues if not accounted for. Consider this example:

  ```js
  setTimeout(() => checkUser(user), 1000);

  const updatedUser = withAddress(user, null);
  setUpdatedUser(updatedUser);
  ```

  The function inside `setTimeout` will run after one second. By then, the original `user`'s address would have changed to null. If the `checkUser` function is expecting the original `user`'s unmodified address, the code will fail.

  To avoid this, we can create a shallow copy of the `user` & update it as shown below:

  ```js
  const withAddress = (user, address) => {
    const newUser = { ...user };
    newUser.address = address;
    return newUser;
  };
  ```

  This solution creates a new object `newUser` and updates the address of that object. This `newUser` object is returned thus making sure there are no changes in the original input data `user`.

  Here is the shorter way of writing the same.
  ```js
  const withAddress = (user, address) => ({ ...user, address });
  ```

- Another condition to be a pure function is that it should not cause any other side effects outside the function. Consider a function that returns part of a given array.
  ```js
  const names = ["Oliver", "Eve", "Sam", "John"];
  const sliceArray = (a, b) => names.splice(a, b);

  console.log(sliceArray(1, 2)); //=> ["Eve", "Sam"]
  console.log(names); //=> ["Oliver", "John"]
  ```
  This is also not a pure function because it mutates the `names` array which is not part of the `sliceArray` function.

  To make this a pure function, we would need to return a copy of `names` which has the values from index `a` to `b`. The `slice` function always returns a new copy of the object instead of mutating `names`. We can rewrite the `sliceArray` function as follows:
  ```js
  const names = ["Oliver", "Eve", "Sam", "John"];
  const sliceArray = (a, b) => names.slice(a, b + a);

  console.log(sliceArray(1, 2)); //=> ["Eve", "Sam"]
  console.log(names); //=> ["Oliver", "Eve", "Sam", "John"]
  ```
