Assign value to the specified key if value is not empty.

1. Input will be a plain object with values of type of `string` or `number`.
2. Assign the `value` to given `key` if the given `value` is not empty.
3. Do not update the `key` if the given value is empty.

For example:
```js
const data = {
  name: "Sam",
  location: "Mumbai",
};
var key = "age";
var value = 30;

Output:
{
  name: "Sam",
  location: "Mumbai",
  age: 30
}
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const updateData = ({ data, key, value }) => {
  // write your code here
}
</code>

<solution>
const updateData = ({ data, key, value }) => {
  if (value === null || value === undefined || value === "") return data;

  return {
    ...data,
    [key]: value,
  };
};
</solution>

<testcases>
<caller>
const updatedData = updateData({ data, key, value });
console.log(JSON.stringify(updatedData, null, 2));
</caller>
<testcase>
<i>
const data = {
  name: "Alex",
  location: "Kochi",
};
var key = "age";
var value = 30;
</i>
</testcase>
<testcase>
<i>
const data = {
  item: "Pepsi",
  quantity: 120,
};
var key = "quantity";
var value = 0;
</i>
</testcase>
<testcase>
<i>
const data = {
  name: "Stuart",
  location: "Pune",
};
var key = "location";
var value = "";
</i>
</testcase>
<testcase>
<i>
const data = {
  name: "Juan",
  pto: 32,
};
var key = "pto";
var value = 0;
</i>
</testcase>
</testcases>
</codeblock>
