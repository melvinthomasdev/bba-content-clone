Use `Object.entries()` to
get all the **key-value pairs**
of the `bird` object.

Use `console.log` to show the values.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const bird = {
  type: "sparrow",
  canFly: true,
  numberOfClaws: 4
};

console.log();
</code>

<solution>
const bird = {
  type: "sparrow",
  canFly: true,
  numberOfClaws: 4
};

console.log(Object.entries(bird));
</solution>
</codeblock>