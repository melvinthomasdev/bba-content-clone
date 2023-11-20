Consider below details of a `person`. Check if it is empty or not.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const person = {
  id: 101,
  name: "John Doe",
};

const personIsEmpty = //Complete this

console.log(personIsEmpty);

</code>
<solution>

const person = {
  id: 101,
  name: "John Doe",
};

const personIsEmpty = R.isEmpty(person);

console.log(personIsEmpty);

</solution>
</codeblock>
