Arrow functions (also called "fat arrow functions") are one of the most popular
features introduced in ES6. You should prefer arrow functions of function
declarations because of the following reasons:

Arrow functions lead to a shorter and concise syntax which improves the code
readability. You can make use of implicit returns when using an arrow function.
You should make use of implicit returns whenever you can. Implicit returns
basically means that you can skip the curly braces that wrap a function body
along with the return keyword and directly return a value.

Implicit returns work if an arrow function does not contain any business logic
other than returning a value. These functions are sometimes referred to as dumb
functions too because they don't do much other than returning a value. For
example:

```javascript
const squareOf = num => {
  return num ** 2;
};
```

We can rewrite the display function in the above code snippet like so:

```javascript
const squareOf = num => num ** 2;
```

Another benefit of using arrow functions is that you don't have to bind the
value of this in a class component. The context of `this` inside an arrow
function is the lexical scope within which they are declared.

However, you should take care of using them properly as inline functions inside
the JSX.

## Always prefer arrow functions

Unless you want reference to the `this` keyword binding of the function, always use an arrow function.

```js
// Incorrect
<Avatar onClick={function noRefCheck() {}} /> 
 
// Correct
<Avatar onClick={() => {}} /> 
```

## How to use inline functions?

It is very convenient to use inline functions in React. They are mostly used to
declare and pass a callback function to event handlers such as `onClick`. You
should avoid using an inline function if the function body contains multiple
lines. In such case it is better to avoid using an inline function as it can
lead to poor code readability. Instead you should define a function outside of
the JSX and pass the function to the event handler as a callback.

```jsx
const Display = ({ props }) => {
  const handleButtonClick = () => {
    setClicked(true);
    callSomeFunction();
    callAnotherfunction();
  };

  return (
    <>
      <button
        onClick={() => {
          // bad
          setClicked(true);
          callSomeFunction();
          callAnotherfunction();
        }}
      >
        Click Me!
      </button>
      // good
      <button onClick={handleButtonClick}>Click Me!</button>
    </>
  );
};
```
