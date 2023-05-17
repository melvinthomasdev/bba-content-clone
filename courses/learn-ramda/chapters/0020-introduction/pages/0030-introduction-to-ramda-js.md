RamdaJS (abbreviated as `Ramda`) makes it easier to apply the functional programming style to JavaScript, often making it more readable with elegant code. It has all the features of functional programming such as pure functions, immutability and no side effects.

Ramda takes in functions first and data last. This along with currying makes it easy to compose functions together (One of the main aspects of functional programming) with very little code.

To show the simplicity of using Ramda consider the following example:
```js
const users = [
  { id: 1, name: "McQueen" },
  { id: 2, name: "Mater" },
  { id: 3, name: "Sally" },
];
```
We need to sort the above array based on the name attribute. In vanilla JS we would write as follows:
```js
const sortedUsers = users.sort((a, b) => {
  if ( a.name < b.name ) {
    return -1;
  }
  if ( a.name > b.name ) {
    return 1;
  }
  return 0;
});
```

In Ramda we could write the above as:
```js
const sortedUsers = R.sortBy(R.prop("name"), users)
```

We can already see the declarative style in action here. Instead of telling how to sort the array, we are asking it to sort by the `name` key and return the result.

The above vanilla JS also mutates the `users` array while the Ramda code returns a new array with the sorted values.

Trying to learn and use the full set of methods provided by Ramda will be a big overhead and much too time-consuming. Thus we will only be advocating making use of the cherry-picked methods we have covered in this book.

## Currying in Ramda

Most of the Ramda functions follow a similar function signature in which we pass the properties as the first set of arguments and then we pass actual data that we want to manipulate towards the end. This is to ensure that we will be able to curry the particular data.

Let's take the example of `remove` method to understand currying better.

```js
const arr = [1,2,3,4,5]

remove(1, 2, arr) // returns [1,4,5]
remove(1, 2)(arr) // returns [1,4,5]
remove(1)(2)(arr) // returns [1,4,5]

const func = remove(1, 2) // returns the curried function.
func(arr) // returns [1,4,5]
```
Now we could pass in any array to `func` and it would work as `remove(1, 2, arr)`. The input array is curried to `remove(1, 2)`.

As we can see, there is a difference from the currying concept we learned earlier. We transformed a function callable as `f(a, b, c)` into `f(a)(b)(c)`. Ramda works much more cleanly. The function can be called as `f(a, b, c)`, `f(a, b)(c)` or `f(a)(b)(c)`.

If `f` is called with all 3 arguments, it returns the computed result. But if it is called with fewer arguments than needed, then a transformed or curried version of `f` is returned. i.e,
- A call `f(a, b, c)` would compute the result.
- A call `f(a, b)` would return a curried function that can accept one more argument.
- A call `f(a)` would return a curried function that can accept one or two more arguments.
- Calling `f(a)` with one argument i,e `f(a)(b)` would again return a curried function that can accept one more argument.
