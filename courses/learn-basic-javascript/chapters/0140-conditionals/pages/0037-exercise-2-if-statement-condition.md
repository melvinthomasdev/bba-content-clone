Given is data of three people.

Update the code by logging to
the console whoever is younger
than **30** years,
in the following manner:
`[Person Name] is younger than 30 years.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const personOne = {
  name: "Alice",
  age: 25
};

const personTwo = {
  name: "Bob",
  age: 32
};

const personThree = {
  name: "Charlie",
  age: 28
};

// Write your code below this line
</code>

<solution>
const personOne = {
  name: "Alice",
  age: 25
};

const personTwo = {
  name: "Bob",
  age: 32
};

const personThree = {
  name: "Charlie",
  age: 28
};

// Write your code below this line
if (personOne.age < 30) {
  console.log(`${personOne.name} is younger than 30 years.`);
};

if (personTwo.age < 30) {
  console.log(`${personTwo.name} is younger than 30 years.`);
};

if (personThree.age < 30) {
  console.log(`${personThree.name} is younger than 30 years.`);
};
</solution>
</codeblock>