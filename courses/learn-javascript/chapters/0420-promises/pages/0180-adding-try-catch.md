In the last lesson we learned how to use `async` and `await` to make asynchronous code look synchronous but we didn't handle any errors. In this lesson we will see how to handle errors in `async/await` code.

To handle errors in `async/await` code, we use the `try...catch` block. Let's incorporate error handling to the code we wrote in the previous lesson.

<codeblock language="javascript" type="lesson" foldLines="1-44">
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
      const launchSuccess = false;
      if (launchSuccess) {
        resolve("Rocket launched!");
      } else {
        reject("Rocket launch failed.");
      }
    }, 2000);
  });

const initiateRocketLaunch = async () => {
  try {
    await gatherRocketParts();
    await assembleRocket();
    await fuelRocket();
    await performPreLaunchChecks();
    const launchStatus = await launchRocket();
    console.log(launchStatus);
    console.log("Rocket launch process completed.");
  } catch (error) {
    console.log(error);
    console.log("Rocket launch process completed.");
  }
};

initiateRocketLaunch();
</code>
</codeblock>

In the above example, we've wrapped the code inside the async function in a `try...catch` block. If any of the promises inside the async function reject, the error will be caught by the `catch` block and logged to the console.

Remember the `finally` method we learned about in the [finally lesson](https://courses.bigbinaryacademy.com/learn-javascript/promises/finally-method/)? Similarly, in `try...catch` we have `finally` block. The `finally` block will run regardless of whether the promises inside the async function are fulfilled or rejected. Let's add `finally` block to the code above.

<codeblock language="javascript" type="lesson" foldLines="1-44">
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
      const launchSuccess = false;
      if (launchSuccess) {
        resolve("Rocket launched!");
      } else {
        reject("Rocket launch failed.");
      }
    }, 2000);
  });

const initiateRocketLaunch = async () => {
  try {
    await gatherRocketParts();
    await assembleRocket();
    await fuelRocket();
    await performPreLaunchChecks();
    const launchStatus = await launchRocket();
    console.log(launchStatus);
  } catch (error) {
    console.log(error);
  } finally {
    console.log("Rocket launch process completed.");
  }
};

initiateRocketLaunch();

</code>
</codeblock>

In the above example, the console will log `Rocket launch process completed.` regardless of whether the rocket launch succeeds or fails.