You are provided with two functions: **addSuffix** and **printSuffixed** to manipulate strings with a provided suffix,

- **addSuffix**: This function should take two parameters: suffix (a string) and string (the original string). It should return a new string with the provided suffix appended to the end of string.

- **printSuffixed**: This function should take an object as its parameter, which contains two properties: **suffix** and **string**.  It then calls **addSuffix** by passing these parameters and returns the returning value.

**printSuffixed** is the function, that will be called first. **Do not modify the function names.**

For example:
```js
Input: string = "Overcast" suffix = "Sky"

Output: "Overcast Sky"
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Update the below functions

const addSuffix = () => {

};
const printSuffixed = () => {

};
</code>

<solution>
const addSuffix = (string, suffix) => `${string}${suffix}`;

const printSuffixed = ({ suffix, string }) => (addSuffix(string, suffix));
</solution>

<testcases>
<caller>
console.log(printSuffixed({ suffix, string }));
</caller>
<testcase>
<i>
const string = "fear";
const suffix = "less";
</i>
</testcase>
<testcase>
<i>
const string = "star";
const suffix = "light";
</i>
</testcase>
<testcase>
<i>
const string = "sun";
const suffix = "shine";
</i>
</testcase>
<testcase>
<i>
const string = "friend";
const suffix = "ship";
</i>
</testcase>
</testcases>
</codeblock>
