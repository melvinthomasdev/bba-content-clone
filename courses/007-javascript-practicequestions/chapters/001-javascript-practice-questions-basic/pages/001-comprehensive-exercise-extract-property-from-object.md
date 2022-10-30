Declare a function `getProperty` to
extract the value of
the given property
from the object.
If the key is present,
return the value.
Otherwise, return the string
`Key doesn't exist`.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const getProperty = function(obj, k) {
  // write your code here
}
</code>

<solution>
const getProperty = function(obj, k) {
  return obj[k] ? obj[k] : "Key doesn't exist"
}
</solution>

<testcases>
<caller>
console.log(getProperty(obj, k));
</caller>
<testcase>
<i>
const obj = {
  name: "Oliver",
  hobby: "Writing"
};
const k = "name";
</i>
</testcase>
<testcase>
<i>
const obj = {};
const k = "name";
</i>
</testcase>
<testcase>
<i>
const obj = {
  name: "Oliver",
  hobby: "Writing"
};
const k = "profession";
</i>
</testcase>
<testcase>
<i>
const obj = {
  name: "Oliver",
  hobby: "Writing"
};
const k = 'hobby';
</i>
</testcase>
</testcases>
</Editor>