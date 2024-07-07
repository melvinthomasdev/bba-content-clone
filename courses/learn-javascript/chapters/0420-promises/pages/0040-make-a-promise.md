In the previous lesson, we learned about callbacks and how they can be used to handle asynchronous operations. We also saw that callbacks can lead to callback hell when we need to coordinate multiple asynchronous operations. 
In this lesson we'll learn about promises and see how it can be used to solve the problem of callback hell.

A **Promise** is an object that represents the eventual completion or failure of an asynchronous operation. It's a way to handle tasks that take time. Let's use an analogy to understand promises better and see how they relate to real-world promises.

Think of launching a rocket like making a promise. When you press the launch button, you're waiting to see if it goes up smoothly or if there's a problem. It's like a promise about what will happen next.

Here, the rocket launch represents a promise, and it can be in one of three states:

**Pending**: The moment you initiate the launch, it's pending because the rocket hasn't taken off yet. You're uncertain if it will be a successful launch or if any issues will arise.

**Fulfilled**: The rocket successfully launches into space. In this case, the promise is fulfilled because it was successful.

**Rejected**: Something went wrong during the launch. Maybe there was a technical glitch, and the rocket couldn't take off as planned. In this case, the promise is rejected because it couldn't be fulfilled as expected.

Just like a real-world promise, a JavaScript promise can be in one of these three states - pending, fulfilled, or rejected. A promise is pending when it's created. It's fulfilled when the asynchronous operation is successful, and it's rejected when the asynchronous operation fails.

Now, let's see how we can create a promise in JavaScript and use it to handle asynchronous operations. We can create a promise using the `Promise` constructor. It takes a callback function with two parameters - `resolve` and `reject`. The `resolve` function is called when the promise is fulfilled, and the `reject` function is called when the promise is rejected.

Let's see how this works. We'll create a promise that represents a rocket launch.

```javascript
const rocketLaunch = () =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      const launchSuccess = true;
      if (launchSuccess) {
        resolve("Rocket successfully launched!");
      } else {
        reject("Uh-oh, the rocket launch encountered a problem.");
      }
    },5000);
  });
```

Here, we've created a function called `rocketLaunch` that returns a promise. The promise takes a callback function with two parameters - `resolve` and `reject`. Inside the callback, we have a `setTimeout` function that simulates a 5 seconds delay. After the delay, we check if the launch was successful. If it was successful, we call `resolve` with a success message. If there's an issue, we call `reject` with an error message.

Now, let's call the `rocketLaunch` function and console log the result.

<codeblock language="javascript" type="lesson">
<code>
const rocketLaunch = () =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      const launchSuccess = true;
      if (launchSuccess) {
        resolve("Rocket successfully launched!");
      } else {
        reject("Uh-oh, the rocket launch encountered a problem.");
      }
    }, 5000);
  });

const status = rocketLaunch();
console.log(status);
</code>
</codeblock>

If you check the console, you'll see that the output is `Promise { <pending> }`. This means that the promise is still pending. That's because the promise is only fulfilled or rejected after the `setTimeout` function is executed. So, how do we wait for the promise to be fulfilled or rejected before we console log the result? We'll learn how to do that in the next lesson.
