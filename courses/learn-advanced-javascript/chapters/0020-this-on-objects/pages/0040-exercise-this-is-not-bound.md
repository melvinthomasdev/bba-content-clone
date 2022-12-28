Write the definition of `displaySound` such that
it displays the value of the `name` property
of the object whose method `displaySound` is assigned to,
followed by **": Chirp chirp"**,
using a template string.

For example,
if it is invoked from `bird`,
the output should be
**"Sparrow: Chirp chirp"**.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
function displaySound() {

};

const bird = {
  name: "Sparrow",
  makeSound: displaySound,
};

const insect = {
  name: "Cricket",
  makeSound: displaySound,
};

bird.makeSound();
insect.makeSound();
</code>

<solution>
function displaySound() {
  console.log(`${this.name}: Chirp chirp`);
};

const bird = {
  name: "Sparrow",
  makeSound: displaySound,
};

const insect = {
  name: "Cricket",
  makeSound: displaySound,
};

bird.makeSound();
insect.makeSound();
</solution>
</codeblock>