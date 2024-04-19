Use the `find()` method
to find if `Apple` is present
in the array of `fruits`.

For example:
```js
Input: ["Banana", "Orange", "Strawberry", "Blueberry"]

Output:
undefined
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
  <code>
    const fruits = ["Banana", "Orange", "Apple", "Strawberry", "Blueberry"];
    const isApple = ; console.log(isApple);
  </code>

  <solution>
    const fruits = ["Banana", "Orange", "Apple", "Strawberry", "Blueberry"];
    const isApple = fruits.find(fruit => fruit === "Apple");
    console.log(isApple);
  </solution>
</codeblock>
```
