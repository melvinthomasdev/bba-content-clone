Define a method `makeSound` inside the object `bird`.
The method should display **"Chirp chirp"** on invocation.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird = {
  name: "Sparrow",
  claws: 4,
}

bird.makeSound();
</code>

<solution>
const bird = {
  name: "Sparrow",
  claws: 4,
  makeSound: () => console.log("Chirp chirp"),
}

bird.makeSound();
</solution>
</codeblock>