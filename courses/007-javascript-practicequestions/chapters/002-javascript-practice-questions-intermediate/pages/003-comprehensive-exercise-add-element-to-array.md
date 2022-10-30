Add the given element to the array if it is not present in it.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const addToList = (list, value) => {
  // write your code here
}
</code>

<solution>
const addToList = (list, value) => {
  if (!list.includes(value)) {
    list.push(value);
  }
  return list;
}
</solution>

<testcases>
<caller>
const updatedList = addToList(list, value);
console.log(updatedList.join(", "));
</caller>
<testcase>
<i>
const list = ["Sam", "Ann", "Oliver"];
const value = "Smith";
</i>
</testcase>
<testcase>
<i>
const list = ["Sam", "Ann", "Smith"];
const value = "Smith";
</i>
</testcase>
<testcase>
<i>
const list = ["Ann", "Oliver"];
const value = "Sam";
</i>
</testcase>
<testcase>
<i>
const list = ["Ann", "Sam", "Oliver"];
const value = "Oliver";
</i>
</testcase>
</testcases>
</Editor>