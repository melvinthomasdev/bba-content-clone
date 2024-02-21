In the last lesson, we learned how to use callbacks to handle asynchronous code. Callbacks are effective for managing asynchronous code, but coordinating multiple asynchronous functions can become challenging with callbacks.
Let's see how we can use callbacks to coordinate multiple asynchronous functions and how this can lead to a problem known as **callback hell**.

To understand callback hell, let's consider a real-world example. Imagine we are in the control room of a space center. We are in charge of preparing a rocket for launch. We need to perform several tasks in a specific order to launch the rocket successfully. We need to gather rocket parts from the warehouse, assemble the rocket, fuel it, perform pre-launch checks, and finally launch it. Each of these tasks is performed by a different person. We need to coordinate the tasks to ensure that the rocket is launched successfully.

Let's see how we can coordinate these tasks using callbacks. First, we will create functions to represent each task. 

1. `gatherRocketParts` - gathers rocket parts from the warehouse

    ```javascript
    const gatherRocketParts = callback => {
      setTimeout(() => {
        console.log("Rocket parts gathered");
        callback();
      }, 1000);
    };
    ```

2. `assembleRocket` - assembles the rocket

    ```javascript
    const assembleRocket = callback => {
      setTimeout(() => {
        console.log("Rocket assembled");
        callback();
      }, 1500);
    };
    ```

3. `fuelRocket` - fuels the rocket

    ```javascript
    const fuelRocket = callback => {
      setTimeout(() => {
        console.log("Rocket fueled");
        callback();
      }, 2000);
    };
    ```

4. `performPreLaunchChecks` - performs pre-launch checks

    ```javascript
    const performPreLaunchChecks = callback => {
      setTimeout(() => {
        console.log("Pre-launch checks completed");
        callback();
      }, 1000);
    };
    ```

5. `launchRocket` - launches the rocket

    ```javascript
    const launchRocket = () => {
      setTimeout(() => {
        console.log("Rocket launched!");
      }, 2000);
    };
    ```

Now we need to coordinate these functions to launch the rocket. We need to call each function in the correct order. We can do this by passing each function as a callback to the previous function as shown below.

<codeblock language="javascript" type="lesson" foldLines="1-34">
<code>
const gatherRocketParts = callback => {
  setTimeout(() => {
    console.log("Rocket parts gathered");
    callback();
  }, 1000);
};

const assembleRocket = callback => {
  setTimeout(() => {
    console.log("Rocket assembled");
    callback();
  }, 1500);
};

const fuelRocket = callback => {
  setTimeout(() => {
    console.log("Rocket fueled");
    callback();
  }, 2000);
};

const performPreLaunchChecks = callback => {
  setTimeout(() => {
    console.log("Pre-launch checks completed");
    callback();
  }, 1000);
};

const launchRocket = () => {
  setTimeout(() => {
    console.log("Rocket launched!");
  }, 2000);
};

gatherRocketParts(() => {
  assembleRocket(() => {
    fuelRocket(() => {
      performPreLaunchChecks(() => {
        launchRocket();
      });
    });
  });
});
</code>
</codeblock>

This code works, but this nested structure is challenging to read, understand, and debug. Each function is nested inside the callback of the previous function. This is known as **callback hell**. If we need to add another step to the process, we need to add another level of nesting. This makes the code even harder to read. This is a common problem with callbacks. In the next lesson, we will learn how to use promises to solve this problem.
