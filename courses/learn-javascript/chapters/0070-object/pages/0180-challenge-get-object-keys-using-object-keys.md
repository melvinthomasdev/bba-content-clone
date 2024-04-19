Use `Object.keys()` to
get all the **keys** from
the `bird` object.

Use `console.log` to show the keys.

```js
Output:
['type', 'canFly', 'numberOfClaws']
```

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

console.log(Object.keys(bird));
</solution>
</codeblock>
