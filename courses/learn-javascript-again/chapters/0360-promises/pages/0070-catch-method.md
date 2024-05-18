The `catch` method is used to handle a promise when it's rejected. It also takes a callback function as a parameter. The callback function takes the rejected value as a parameter.

Let's take the same example of the `rocketLaunch` promise from the previous lesson and see how to use the `catch` method to handle the promise when it's rejected. We'll set the value of the `launchSuccess` variable to `false` to simulate a rejected promise.

<codeblock language="javascript" type="lesson">
<code>
const rocketLaunch = () =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      const launchSuccess = false;
      if (launchSuccess) {
        resolve("Rocket successfully launched!");
      } else {
        reject("Uh-oh, the rocket launch encountered a problem.");
      }
    }, 5000);
  });

rocketLaunch()
  .then(resolvedValue => {
    console.log("'then' method called");
    console.log(resolvedValue);
    console.log("Rocket launch process completed.");
  })
  .catch(rejectedValue => {
    console.log("'catch' method called");
    console.log(rejectedValue);
    console.log("Rocket launch process completed.");
  });
</code>
</codeblock>

If we run the above code, the output will be:

```
'catch' method called
Uh-oh, the rocket launch encountered a problem.
Rocket launch process completed.
```

Here the `reject` method is called instead of the `resolve` method because the `launchSuccess` variable is set to `false`. A promise is rejected when the `reject` method is called. Since the promise is rejected, the `catch` method is called, and the rejected value is passed to the callback function. In this case, the rejected value is `Uh-oh, the rocket launch encountered a problem.`.

If you notice the above code, you'll see that we're repeating the same code `console.log("Rocket launch process completed.");` in both the `then` and `catch` methods. We can avoid this repetition by using the `finally` method.
We'll learn about the `finally` method in the next lesson.