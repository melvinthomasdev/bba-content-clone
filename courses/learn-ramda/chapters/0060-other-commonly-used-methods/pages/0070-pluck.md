The `pluck` function is used on an array of objects to pick the value of the given property from every object inside it.


In this example, we are plucking `name` from every object inside `users` array:
```js
const users = [
  { id: 1, name: "Oliver" },
  { id: 2, name: "Eve" },
  { id: 3, name: "Sam" },
];
pluck("name", users); //=> ["Oliver", "Eve", "Sam"]
```

`pluck` can also be used on nested objects having a similar structure. Consider the following example:
```js
const users = {
  "user1": {
    firstName: "Oliver",
    lastName: "Smith",
  },
  "user2": {
    firstName: "Eve",
    lastName: "Smith",
  },
  "user3": {
    firstName: "Sam",
    lastName: "Smith",
  },
};
pluck("firstName", users); //=> {"user1": "Oliver", "user2": "Eve", "user3": "Sam"}
```

It can also be used with nested arrays if we provide the index.
```js
const names = [ ["Steve", "Rogers"], ["Sam", "Styles"], ["Oliver", "Smith"], ["John", "Doe"] ];
pluck(0, names); //=> ["Steve", "Sam", "Oliver", "John"]
```
Here we provided the index 0 for the `names` array. This means it takes the value at index 0 for each sub-list of `names`.

Similarly, to get the values at index 1 for each sub-list of `names` we would do as follows:
```js
pluck(1, names); //=> ["Rogers", "Styles", "Smith", "Doe"]
```
