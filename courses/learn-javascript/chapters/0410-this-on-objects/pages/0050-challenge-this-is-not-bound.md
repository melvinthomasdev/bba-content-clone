Write the definition of `displaySound` such that
it displays the value of the `name` property
of the object whose method `displaySound` is assigned to,
followed by **": Woof woof"**,
using a template string.

For example,
if it is invoked from `dog`,
the output should be
**"Dog: Woof woof"**.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
function displaySound() {

};

const dog = {
  name: "Dog",
  makeSound: displaySound,
};

const wolf = {
  name: "Wolf",
  makeSound: displaySound,
};

dog.makeSound();
wolf.makeSound();
</code>

<solution>
function displaySound() {
  console.log(`${this.name}: Woof woof`);
};

const dog = {
  name: "Dog",
  makeSound: displaySound,
};

const wolf = {
  name: "Wolf",
  makeSound: displaySound,
};

dog.makeSound();
wolf.makeSound();
</solution>
</codeblock>
