Use `Object.values()` to
get all the **values** stored
in the `bird` object.

Use `console.log` to show the values.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const bird = {
  type: "owl",
  canFly: true,
  numberOfClaws: 4
};

console.log();
</code>

<solution>
const bird = {
  type: "owl",
  canFly: true,
  numberOfClaws: 4
};

console.log(Object.values(bird));
</solution>
</codeblock>
