Declare the `updateObject` function to
update the property in the given object.

1. If the property is not present,
add the given property.
2. You must use two spaces in the output JSON string
for readability purposes.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const updateObject = ({ obj, property, value }) => {
  // write your code here
}
</code>

<solution>
const updateObject = ({ obj, property, value }) =>
  (
    {
      ...obj,
      [property]: value,
    }
  );
</solution>

<testcases>
<caller>
console.log(updateObject({ obj, property, value }));
</caller>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "oliver_smith",
  name: "Oliver Smith",
};
const property = "age";
const value = 32;
</i>
</testcase>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "oliver_smith",
  name: "Oliver Smith",
};
const property = "userName";
const value = "sam_smith";
</i>
</testcase>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "sam_Smith",
  name: "Oliver Smith",
};
const property = "name";
const value = "Sam Smith";
</i>
</testcase>
<testcase>
<i>
const obj = {
  id: 1,
  userName: "anna_smith",
  name: "Anna Smith",
};
const property = "address";
const value = "432 Street, Downtown";
</i>
</testcase>
</testcases>
</codeblock>