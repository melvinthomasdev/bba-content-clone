The `then` method is used to handle a promise when it's fulfilled. It takes a callback function as a parameter. The callback function takes the resolved value as a parameter.

Let's see an example of how to use the `then` method to handle a promise when it's fulfilled.

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

rocketLaunch()
  .then(resolvedValue => {
    console.log("'then' method called");
    console.log(resolvedValue);
    console.log("Rocket launch process completed.");
  })
</code>
</codeblock>

If we run the above code, the output will be:

```
'then' method called
Rocket successfully launched!
Rocket launch process completed.
```

Here the `launchSuccess` variable is set to `true`, so the `resolve` method is called. A promise is fulfilled when the `resolve` method is called. Since the promise is fulfilled, the `then` method is called, and the resolved value is passed to the callback function. In this case, the resolved value is `Rocket successfully launched!`.

In the next lesson, we'll learn how to handle promises when they're rejected using the `catch` method.