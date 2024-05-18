The `finally` method is invoked regardless of whether the promise is fulfilled or rejected. It takes a callback function as a parameter. It's typically used to perform cleanup operations or to execute code that should run regardless of the promise's outcome.

Let's take the same example of the `rocketLaunch` promise from the previous lesson and see how to use the `finally` method to remove the duplicate code from the `then` and `catch` methods.

<codeblock language="javascript" type="lesson">
<code>
const rocketLaunchPromise = () =>
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

rocketLaunchPromise()
  .then(resolvedValue => {
    console.log("'then' method called");
    console.log(resolvedValue);
  })
  .catch(rejectedValue => {
    console.log("'catch' method called");
    console.log(rejectedValue);
  })
  .finally(() => {
    console.log("Rocket launch process completed.");
  });
</code>
</codeblock>

To try out the `finally` method, you can set the value of `launchSuccess` variable to both `true` and `false` and observe the output. In both cases, the output will include the message `Rocket launch process completed` from the `finally` block.