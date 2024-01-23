The function `getProperty` should
extract the given property
from a given object.
If the given property is not present,
return the string **Not found**.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getProperty = ({ object, property }) => // write your code here
</code>

<solution>
const getProperty = ({ object, property }) => object[property] || "Not found"
</solution>

<testcases>
<caller>
console.log(getProperty({ object, property }));
</caller>
<testcase>
<i>
const object = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "name";
</i>
</testcase>
<testcase>
<i>
const object = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "age";
</i>
</testcase>
<testcase>
<i>
const object = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "phone";
</i>
</testcase>
<testcase>
<i>
const object = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "id";
</i>
</testcase>
</testcases>
</codeblock>