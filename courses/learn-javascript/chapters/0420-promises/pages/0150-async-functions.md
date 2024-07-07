By using promises, we have avoided the callback hell problem. However, it doesn't look as neat as synchronous code.
We can make our asynchronous code look synchronous by using `async/await`. 

First, let's understand what `async` keyword does. When we append the `async` keyword to a function, it means that the function will always return a promise. Even if a function actually returns a non promise value, it will be wrapped in a resolved promise.

Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
const launchRocket = async () => {
  return "Rocket successfully launched!";
};

console.log(launchRocket());
</code>
</codeblock>

Here the return value of the `launchRocket` function is a string. But since we have used the `async` keyword, the return value is wrapped in a resolved promise. So the output will be `Promise {<fulfilled>: 'Rocket successfully launched!'}`.

We can use the `.then()` method which we learned about in the previous lesson to access the value returned by the promise.

<codeblock language="javascript" type="lesson">
<code>
const launchRocket = async () => {
  return "Rocket successfully launched!";
};

launchRocket().then(successMessage => {
  console.log(successMessage);
});
</code>
</codeblock>

Here the output will be `Rocket successfully launched!`. But here still the code doesn't look synchronous. We can make it look synchronous by using the `await` keyword which we'll learn about in the next lesson.
