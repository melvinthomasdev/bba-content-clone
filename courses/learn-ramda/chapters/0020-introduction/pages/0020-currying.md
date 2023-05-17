**Currying** is a transformation of functions that translates a function from callable as `f(a, b, c)` into callable as `f(a)(b)(c)`. Currying doesn’t call a function. It just transforms it.

To explain it simply, instead of calling one function with 3 arguments, we call a function with one argument which returns another function that accepts the second argument. This in turn returns a third function which actually evaluates all 3 arguments and returns the result.

We will see currying with the example of a JavaScript function before moving on to Ramda. Consider an `add` function that takes 2 integers as arguments and returns the sum.

```js
const add = (a, b) => a + b;
console.log(add(1, 2)) //=> returns 3
console.log(add(1, 4)) //=> returns 5
```

Now let's curry the above `add` function.
```js
const add = a => b => a + b;
```

Let's try to break down what's happening here. `add` is a function that accepts 1 argument `a` and returns a wrapper function. This wrapper function accepts a second argument `b` and returns the sum of both arguments.

So, now the add function can be called as follows:
```js
console.log(add(1)(2)) //=> returns 3
```

This offers us a significant advantage as shown below:
```js
const increment = add(1);
const decrement = add(-1);

console.log(increment(5)) //=> returns 6
console.log(decrement(5)) //=> returns 4
```

It can be seen how effective it is in reusing code and making it more readable. This is the power of currying.

Now, in the above example `add` can no longer be called as `add(a, b)`. But, in a proper implementation of curried functions `add` can be called as both `add(a, b)` and `add(a)(b)`.
