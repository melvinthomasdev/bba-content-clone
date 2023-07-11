Modify the definition of
the `displayNameAndColors` method
in the `bird` object to display
the value of the `name` property followed by
all the elements of the `colors` property
separated by - **", "**,
using a template string.

For the code below,
the output should be
**"Owl has these colors - brown, black, gray"**.

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