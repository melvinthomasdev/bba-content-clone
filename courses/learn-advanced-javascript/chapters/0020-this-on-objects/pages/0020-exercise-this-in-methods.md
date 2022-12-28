Modify the definition of
the `displayNameAndColors` method
in the `bird` object to display
the value of the `name` property followed by
all the elements of the `colors` property
separated by - **", "**,
using a template string.

For the code below,
the output should be
**"Sparrow has these colors - brown, black, yellow"**.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird = {
  name: "Sparrow",
  colors: ["brown", "black", "yellow"],
  displayNameAndColors() {},
}

bird.displayNameAndColors();
</code>

<solution>
const bird = {
  name: "Sparrow",
  colors: ["brown", "black", "yellow"],
  displayNameAndColors() {
    console.log(`${this.name} has these colors - ${this.colors.join(", ")}`);
  },
}

bird.displayNameAndColors();
</solution>
</codeblock>