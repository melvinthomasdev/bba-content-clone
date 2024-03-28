In the code given below, console message `Data fetched successfully` is logged before the console message `Data fetched for John`. Please rewrite the code using callback functions to ensure that the console message `Data fetched successfully` is logged only after the console message `Data fetched for John` is logged.

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
const fetchData = user => {
  setTimeout(() => {
    console.log(`Data fetched for ${user}`);
  }, 5000);
};

const onFetchSuccess = () => {
  console.log("Data fetched successfully");
};

fetchData("John");
onFetchSuccess();
</code>

<solution>
const fetchData = (user, callback) => {
  setTimeout(() => {
    console.log(`Data fetched for ${user}`);
    callback();
  }, 3000);
};

const onFetchSuccess = () => {
  console.log("Data fetched successfully");
};

fetchData("John", onFetchSuccess);
</solution>
</codeblock>
