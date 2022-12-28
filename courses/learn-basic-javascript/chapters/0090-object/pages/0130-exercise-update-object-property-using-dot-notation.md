Update the properties of the `bird` object,
as per the table below.

Use **dot notation** to update the object.

| Key           | Value |
| ------------- | ----- |
| canFly        | false |
| numberOfClaws | 3     |

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const bird = {
  type: "sparrow",
  canFly: true,
  numberOfClaws: 5
};

console.log(bird);
</code>

<solution>
const bird = {
  type: "sparrow",
  canFly: true,
  numberOfClaws: 5
};

bird.canFly = false;
bird.numberOfClaws = 3;

console.log(bird);
</solution>
</codeblock>