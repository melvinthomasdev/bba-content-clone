Every lesson in this book is followed by an challenge. It will be a simple hands-on challenge to put into practice what you learned
in the previous chapter.

Due to a technical limitation, all Ramda functions are namespaced under the global variable `R` in all our challenges. So, to access the Ramda function `remove`, you need to call `R.remove` as shown below:

```js
const arr = [1, 2, 3, 4, 5];
R.remove(1, 2, arr); // [1,4,5]
remove(1, 2, arr); // Uncaught ReferenceError: remove is not defined
```

Please make sure to call Ramda functions with the `R` namespace in all the challenges in this book.
