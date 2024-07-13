Write a JavaScript program that implements a function that performs a series of asynchronous operations in sequence using Promises and 'async/await'. You can use `setTimeout` method to simulate asynchronous operations.

<codeblock type="exercise" language="javascript" evaluateAsync="true" testMode="fixedInput">
<code>
// Write your code here
</code>

<solution>
const asyncOperation1 = () => new Promise((resolve) => {
    setTimeout(() => {
      console.log('Asynchronous Operation 1');
      resolve();
    }, 1000);
  });


const asyncOperation2 = () => new Promise((resolve) => {
    setTimeout(() => {
      console.log('Asynchronous Operation 2');
      resolve();
    }, 2000);
  });

const asyncOperation3 = () => new Promise((resolve) => {
    setTimeout(() => {
      console.log('Asynchronous Operation 3');
      resolve();
    }, 1500);
  });

const performOperations = async () => {
  try {
    await asyncOperation1();
    await asyncOperation2();
    await asyncOperation3();
    console.log('All operations completed');
  } catch (error) {
    console.log('Error:', error.message);
  }
}

performOperations();
</solution>
</codeblock>
