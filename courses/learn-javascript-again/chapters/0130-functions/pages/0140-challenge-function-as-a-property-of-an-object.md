Add a method `makeSound` to the object `bird`.
The method should display **"Hoot hoot"** on invocation.

```js
Output:
"Hoot hoot"
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird = {
  name: "Owl",
  claws: 4
}

bird.makeSound();
</code>

<solution>
const bird = {
  name: "Owl",
  claws: 4
}

bird.makeSound = () => console.log("Hoot hoot");

bird.makeSound();
</solution>
</codeblock>
