Complete the JavaScript function to find the first matching item in an array of objects based on a specified pattern. The function takes array and pattern as arguments and should return the matching item.

For example:

```text
Input:
data = [
  { id: 1, name: "Sam", address: { street: "First street", pin: 123456 } },
  { id: 2, name: "Oliver", address: { street: "Second street", pin: 654321 } },
];
pattern = { name: "Sam" };

Output: { id: 1, name: "Sam", address: { street: "First street", pin: 123456 } }
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findMatchingItem = (data, pattern) => {
  // write your code here
}
</code>

<solution>
  const findMatchingItem = (data, pattern) => data.find(item =>
  Object.entries(pattern).every(([key, value]) => item[key] === value));
</solution>

<testcases>
<caller>
console.log(findMatchingItem(data, pattern));
</caller>
<testcase>
<i>
const data = [
    { id: 1, name: 'John', age: 30 },
    { id: 2, name: 'Jane', age: 25 },
    { id: 3, name: 'Alice', age: 35 }
];

const pattern = { age: 35 };

</i>
</testcase>
<testcase>
<i>
const data = [
    { id: 1, name: 'John', age: 30 },
    { id: 2, name: 'Jane', age: 25 },
    { id: 3, name: 'Alice', age: 35 }
];

const pattern = { name: "Jane" };

</i>
</testcase>
</testcases>
</codeblock>
