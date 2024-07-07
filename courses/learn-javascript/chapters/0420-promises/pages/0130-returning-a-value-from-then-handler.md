In the example from the last lesson, each function in the `then` method returns a promise. However, what if a function returns a value instead of a promise? In that case, we can still chain the promises together. This is possible because in this scenario, the `then` method effectively creates a resolved promise with that value and returns it. Therefore, the next `then` method in the chain will receive that value as an argument.

Let's see an example of this in action. 

<codeblock language="javascript" type="lesson">
<code>
const fetchData = () => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      console.log("Data fetched successfully.");
      resolve({ name: "John", age: 30 });
    }, 1000);
  });
}

const processData = (data) => {
  console.log("Data processed:", data);

  return `Processed data for ${data.name}`;
}

fetchData()
  .then(data => processData(data))
  .then(processedData => {
    console.log(processedData);
  });
</code>
</codeblock>

In this example, the `processData` function returns a string instead of a promise. However, the then method in the chain still receives the value returned by `processData` as an argument. This is because the `then` method effectively creates a resolved promise with that value and returns it.