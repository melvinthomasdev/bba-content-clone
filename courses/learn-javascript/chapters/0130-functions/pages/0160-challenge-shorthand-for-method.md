Define a method `makeSound` inside the object `bird`.
The method should display **"Hoot hoot"** on invocation.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird = {
  name: "Owl",
  claws: 4,
}

bird.makeSound();
</code>

<solution>
const bird = {
  name: "Owl",
  claws: 4,
  makeSound: () => console.log("Hoot hoot"),
}

bird.makeSound();
</solution>
</codeblock>