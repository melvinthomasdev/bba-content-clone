We have seen how powerful Ramda can be. It can help to make code much more readable and get rid of unintended side effects due to the use of pure functions. It also helps with functional composition.

But, overuse of Ramda is also a problem. It introduces the very problem we are trying to solve, making the code harder to read. So we must strike an optimal balance between Vanilla JS and Ramda to achieve good readability.

```js
const forever21 = ifElse(gte(__, 21), always(21), inc);
```
What does this code do? It is difficult to make sense of how this code works with the overuse of Ramda and currying concepts. Let's write it in Vanilla JS as shown:
```js
const forever21 = age => age >= 21 ? 21 : age + 1;
```
This is cleaner and someone who looks at the code can understand what's happening. We don't need to use Ramda in every single function in our codebase.


Consider the following cases
```js
//Using Ramda
const isLoading = equals(status, 'loading');

//Using Vanilla JS
const isLoading = status === 'loading';
```

```js
//Using Ramda
const isLoading = or(isOrganizationLoading, isUserLoading);

//Using Vanilla JS
const isLoading = isOrganizationLoading || isUserLoading;
```
```js
//Using Ramda
const isNotShowing = not(isShowing);

//Using Vanilla JS
const isNotShowing = !isShowing;
```

The Ramda code versions may appear more readable, but they use functions that require some learning. The Vanilla JS versions directly use operators, which are widely familiar.

Also, the Ramda functions `equals`, `or`, and `not` are not direct replacements for Vanilla JS `===,` `||` and `!`. These Ramda functions are curried functions and include additional logic, which makes them slower in performance.
