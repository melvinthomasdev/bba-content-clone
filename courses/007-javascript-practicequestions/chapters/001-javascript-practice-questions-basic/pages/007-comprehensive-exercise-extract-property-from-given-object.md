Declare a function `getProperty` to
extract the given property
from a given object.
If the given property is not present,
return the string `Not found`.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const getProperty = function(object, property) {
  // write your code here
}
</code>

<solution>
const getProperty = function(object, property) {
  const value = object[property];
  return value || "Not found";
}
</solution>

<testcases>
<caller>
console.log(getProperty(obj, property));
</caller>
<testcase>
<i>
const obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "name";
</i>
</testcase>
<testcase>
<i>
const obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "age";
</i>
</testcase>
<testcase>
<i>
const obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "phone";
</i>
</testcase>
<testcase>
<i>
const obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "id";
</i>
</testcase>
<testcase>
<i>
const obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030"
};
const property = "address";
</i>
</testcase>
</testcases>
</Editor>