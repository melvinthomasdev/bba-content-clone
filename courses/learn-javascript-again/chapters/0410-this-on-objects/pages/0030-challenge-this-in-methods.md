Modify the definition of
the `displayNameAndColors` method
in the `bird` object to display
the value of the `name` property followed by
all the elements of the `colors` property
separated by - **", "**,
using a template string.

For example:
```js
Input:
bird = {
  name: "Eagle",
  colors: ["white", "black", "gray"],
  displayNameAndColors() {},
}
Output:
"Eagle has these colors - white, black, gray"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird = {
  name: "Owl",
  colors: ["brown", "black", "gray"],
  displayNameAndColors() {},
}

bird.displayNameAndColors();
</code>

<solution>
const bird = {
  name: "Owl",
  colors: ["brown", "black", "gray"],
  displayNameAndColors() {
    console.log(`${this.name} has these colors - ${this.colors.join(", ")}`);
  },
}

bird.displayNameAndColors();
</solution>
</codeblock>
