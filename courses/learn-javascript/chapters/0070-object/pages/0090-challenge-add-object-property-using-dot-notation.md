Add the properties given
in the table below to
the `bird` object.

Use **dot notation** to add the properties.

| Key           | Value |
| ------------- | ----- |
| canFly        | true  |
| numberOfClaws | 4     |

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const bird = {
  type: "owl"
};

console.log(bird);
</code>

<solution>
const bird = {
  type: "owl"
};

bird.canFly = true;
bird.numberOfClaws = 4;

console.log(bird);
</solution>
</codeblock>