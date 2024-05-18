Complete the JavaScript function to omit specific keys from the object and return a new object with all keys from the original object except for those excluded. The function accepts an object and an array of keys to omit as arguments.

For example:

```text
Input: obj = {apple: 1, orange: 2, grape: 4}, keysToOmit = ["apple"]

Output: {orange: 2, grape: 4}
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const omitKeys = (obj, keysToOmit) => {
  // Write your code here
}
</code>

<solution>
const omitKeys = (obj, keysToOmit) =>
  Object.keys(obj).reduce((newObj, key) => {
    if (!keysToOmit.includes(key)) {
      newObj[key] = obj[key];
    }
    return newObj;
  }, {});

</solution>

<testcases>
<caller>
console.log(omitKeys(obj, keysToOmit));
</caller>
<testcase>
<i>
const obj = {a: 1, b: 2, c: 3};
const keysToOmit = ['a', 'c'];
</i>
</testcase>
<testcase>
<i>
const obj = {1: 1, 2: 2, 3: 3};
const keysToOmit = ["0"];
</i>
</testcase>
</testcases>
</codeblock>
