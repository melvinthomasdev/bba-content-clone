The function `doesPropertyExist` should
check whether a given property is present in the object or not.

If the property is present, return `true`. Otherwise, return `false`.

For example:
```js
const obj = {
  name: "Sam",
  age: 30,
  weight: 70
};
const property = "height";

Output:
false
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const doesPropertyExist = ({ obj, property }) => // write your code here
</code>

<solution>
const doesPropertyExist = ({ obj, property }) => Object.keys(obj).indexOf(property) !== -1;
</solution>

<testcases>
<caller>
console.log(doesPropertyExist({ obj, property }));
</caller>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "oliver_smith",
  name: "Oliver Smith"
};
const property = "age";
</i>
</testcase>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "oliver_smith",
  name: "Oliver Smith"
};
const property = "userName";
</i>
</testcase>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "sam_Smith",
  name: "Sam Smith"
};
const property = "address";
</i>
</testcase>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "anna_smith",
  name: "Anna Smith"
};
const property = "name";
</i>
</testcase>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "eve_smith",
  name: "Eve Smith"
};
const property = "name";
</i>
</testcase>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "Sam Smith",
  name: "Sam Smith"
};
const property = "firstName";
</i>
</testcase>
</testcases>
</codeblock>
