`await` is a keyword that can be used inside an async function to pause the execution of the function until a promise is resolved.

Let's take the same example of launching a rocket and see how we can use the `await` keyword to make the code look synchronous.

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

const fuelRocket = rocket =>
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

const initiateRocketLaunch = async () => {
  await gatherRocketParts();
  await assembleRocket();
  await fuelRocket();
  await performPreLaunchChecks();
  const launchStatus = await launchRocket();
  console.log(launchStatus);

};

initiateRocketLaunch();
</code>
</codeblock>

Here in the `launchRocket` function, we use the `await` keyword to pause and wait for specific tasks to complete. We start by waiting for rocket parts, then for the rocket assembly, and so on, ensuring each step finishes before moving to the next. This sequence continues until we launch the rocket.

Another point to note is that the `await` keyword only affects the code inside the async function. The code outside of it will keep running. For example, if we add a `console.log` statement after the `launchRocket` function call, it will be executed immediately after the function call, not after the `launchRocket` function is finished.

<codeblock language="javascript" type="lesson" foldLines="1-45">
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
        console.log("Launched rocket!");
        resolve("Rocket launched!");
      } else {
        reject("Rocket launch failed.");
      }
    }, 2000);
  });

const initiateRocketLaunch = async () => {
  await gatherRocketParts();
  await assembleRocket();
  await fuelRocket();
  await performPreLaunchChecks();
  const launchStatus = await launchRocket();
  console.log(launchStatus);
};

initiateRocketLaunch();
console.log("This happens right after 'launchRocket' call.");
</code>
</codeblock>
