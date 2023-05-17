The `assoc` function is used to set or override the specified property of an object with the given value as shown below:
```js
const obj = { a: 1, b: 2 }
assoc("c", 3, obj); //=> {a: 1, b: 2, c: 3}
assoc("b", 3, obj); //=> {a: 1, b: 3}
```

The `assoc` function is also curried like most other Ramda functions. It comes in handy when we use `assoc` for state updates in React. Consider the following object is stored in state and we want to update the `firstName` attribute:
```js
const user = {
  id: 1,
  firstName: "Sam",
  address: {
    city: "Miami",
    pin: 111111,
  }
};

// The react way would be to use a callback to get the previous state and use spread operator.
setUser(prevUser => ({...prevUser, firstName: "Oliver"}));

// Ramda version of above code
setUser(assoc("firstName", "Oliver"))
```
Here the callback expression is avoided as Ramda returns a curried function that will accept `prevUser` as an argument and then execute.

`assoc` function creates a new copy of the object. All non-primitive properties are copied by reference.
```js
const newUser = assoc("firstName", "Oliver", user)

console.log(user === newUser) //false
console.log(user.address === newUser.address) //true
```
