Use the `for...in` loop
to show all the elements stored
in the `people` array.

Use `console.log` to show the output.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const people = ["Adam", "Eve", "Sam"];
</code>

<solution>
const people = ["Adam", "Eve", "Sam"];
for(const index in people) {
  console.log(people[index]);
}
</solution>
</codeblock>