Declare the `doesPropertyExist` function to
check whether a given property is present in the object or not.

If the property is present, return `true`. Otherwise, return `false`.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const doesPropertyExist = function(obj, property) {
  // write your code here
}
</code>

<solution>
const doesPropertyExist = function(obj, property) {
  return Object.keys(obj).indexOf(property) !== -1;
}
</solution>

<testcases>
<caller>
console.log(doesPropertyExist(obj, property));
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
  name: "Oliver Smith"
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
</testcases>
</Editor>