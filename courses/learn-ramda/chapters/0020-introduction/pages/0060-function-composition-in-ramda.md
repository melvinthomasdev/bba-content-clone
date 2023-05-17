Function composition is an operation that takes functions `f` and `g` and computes them as `f(g(x))`. The input data is passed first to `g` and then the result of that data is passed to `f`. We learned all about Ramda passing data last and currying. These concepts were introduced for the ease of applying function composition.

Consider an array of students. We want to return the names of the top 3 performers.
```js
const students = [
  { marks: 65, name: "Oliver" },
  { marks: 82, name: "Eve" },
  { marks: 100, name: "Sam" },
  { marks: 95, name: "John" },
  { marks: 81, name: "Denver" },
];

const getTopThreeNames = students =>
  [...students].sort((a, b) => b.marks - a.marks) //Sort in descending order
  .slice(0, 3) //Retrieve top 3
  .map(student => student.name) //Extract the name key

console.log(getTopThreeNames(students)) //=> ["Sam", "John", "Eve"]
```
Here, we had to use array destructuring for students because sort mutates the input array. To do the same in functional programming, we would write functions for this logic as follows:
```js
// Accepts an array and a property and sorts by given property
const sortDescBy = (prop, arr) => [...arr].sort((a, b) => b[prop] - a[prop]);

// Accepts an array and an integer n and returns n elements
const retrieveTopN = (n, arr) => arr.slice(0, n);

/// Accepts an array and a property and extracts the selected property
const extractProp = (prop, arr) => arr.map(item => item[prop])
```

We would now apply function composition using the above functions.
```js
const getTopThreeNames = arr =>
  extractProp("name", retrieveTopN(3, sortDescBy("marks", arr)));
console.log(getTopThreeNames(students)) //=> ["Sam", "John", "Eve"]
```

This nested manner of doing functional composition starts getting unwieldy the more operations we need to do on the input. Ramda provides a simple way to make functional composition much more readable. We can make use of the `pipe` function.

We just pass in the list of functions we need, and then pass in the curried data at the end. `pipe` takes care of passing the output of each function as the input of the next function. It does so in a left-to-right manner, i.e, input data is passed to the left-most function first and its output is passed to the next function.

```js
const getTopThreeNames = pipe(sortDescBy("marks"), retrieveTopN(3), extractProp("name"));
console.log(getTopThreeNames(students));
```

But, there is an error with the above code. While `pipe` passes the `students` array as curried data to our three functions, the functions themselves aren't curried. Thus we would not be able to execute the above code.

We can make use of the `curry` function from Ramda to return the curried version of our functions as follows:
```js
// Accepts an array and a property and sorts by given property
const sortDescBy = curry(
  (prop, arr) => [...arr].sort((a, b) => b[prop] - a[prop])
);

// Accepts an array and an integer n and returns n elements
const retrieveTopN = curry(
  (n, arr) => arr.slice(0, n)
);

/// Accepts an array and a property and extracts the selected property
const extractProp = curry(
  (prop, arr) => arr.map(item => item[prop])
);
```

Now `getTopThreeNames` would work as expected. This is the power of Ramda when it comes to the functional programming approach. It makes it much easier to write readable and elegant code in the functional style with features like currying and functional composition.

Let's learn about more Ramda functions in the next chapters.
