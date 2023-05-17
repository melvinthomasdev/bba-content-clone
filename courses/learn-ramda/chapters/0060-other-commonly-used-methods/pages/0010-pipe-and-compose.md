The `pipe` function is used to compose multiple functions together. It's not necessary to use `pipe` to do so but it makes it much more readable. With `pipe`, the data is always curried at the end. It passes the result from one function to another, in left-to-right order. Let's see this with an example.

Consider the following `user` object. We want to take the first name, convert it to lowercase and reverse the string. We can use the `prop` function to get the first name, the `toLower` function to convert to lowercase and the `reverse` function to reverse the string.
```js
const user = {
  firstName: "Oliver",
  lastName: "Smith",
};

const reverseAndLowerCaseName = user => reverse(toLower(prop("firstName", user)));
const result = reverseAndLowerCaseName(user); //=> revilo
```
This is the way we have learned to do function composition. In case we want to do something more, we would just add one more function. Say, check whether the reversed name starts with `rev`.
```js
const isStartingWithRev = startsWith("rev", reverseAndLowerCaseName(user));
```

At one point, this starts getting unreadable. The `pipe` function is helpful here. We can write as follows:
```js
const reverseAndLowerCaseName = pipe(prop("firstName"), toLower, reverse);
const result = reverseAndLowerCaseName(user); //=> revilo

// Adding the startsWith function
const checkStartsWith = pipe(prop("firstName"), toLower, reverse, startsWith("rev"));
const isStartingWithRev = checkStartsWith(user) //=> true
```
In the above example, `pipe` first passes the curried argument (`user`) to `prop("firstName")` which extracts the value of the `firstName` key. This output is then passed to `toLower` which converts it to lower case and passes the output to `reverse` and `startsWith("rev")` respectively.

The `compose` function works the same way as the `pipe` function, but the order of execution of arguments is from right to left.

The above implementation can be done with `compose` as follows:
```js
const checkStartsWith = compose(startsWith("rev"), reverse, toLower, prop("firstName"));
const isStartingWithRev = checkStartsWith(user) //=> true
```
