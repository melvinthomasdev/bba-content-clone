In the last lesson we learned how to handle promises once they're fulfilled or rejected. In this lesson we'll learn how to chain promises together.

For this lets take the same example of launching a rocket. We'll use the same functions we created in the [callback hell lesson](https://courses.bigbinaryacademy.com/learn-intermediate-javascript/promises/callback-hell), but this time we'll wrap them in promises and chain them together instead of using callbacks.

<codeblock language="javascript" type="lesson">
<code>
const gatherRocketParts = () =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log("Gathered rocket parts");
      resolve();
    }, 1000);
  });

const assembleRocket = () =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log("Assembled rocket");
      resolve();
    }, 1500);
  });

const fuelRocket = () =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log("Fueled rocket");
      resolve();
    }, 2000);
  });

const performPreLaunchChecks = () =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log("Performed pre-launch checks");
      resolve();
    }, 1000);
  });

const launchRocket = () =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      const launchSuccess = true;
      if (launchSuccess) {
        resolve("Rocket launched!");
      } else {
        reject("Rocket launch failed.");
      }
    }, 2000);
  });

gatherRocketParts()
  .then(() => assembleRocket())
  .then(() => fuelRocket())
  .then(() => performPreLaunchChecks())
  .then(() => launchRocket())
  .then(successMessage => {
    console.log(successMessage);
  })
  .catch(errorMessage => {
    console.log(errorMessage);
  });
</code>
</codeblock>

Let's see how this works. We begin by calling the `gatherRocketParts` function, which returns a promise. Once this promise is fulfilled, it will be handled by the first `then` method.

Within the first `then` method, the `assembleRocket` function is called and is then returned. This `assembleRocket` function also returns a promise, which is handled by the next `then` method.

This process is continued until the `launchRocket` function is reached, which also returns a promise that is handled by the last `then` method in the chain and logs the success message.

At any point if there's an error, let's say assembling the rocket fails, the `catch` method at the end will be triggered. It's like a backup plan, ensuring that if something doesn't go as expected in any step, we catch the problem and handle it gracefully, preventing the whole process from breaking down. So, the `catch` is there to handle errors and make our code more robust.

With this approach, we can chain together as many promises as we want and we can handle errors in a single place. This is a much cleaner approach than using callbacks and it eliminates the callback hell problem.
