The following code throws an error
because `car2` does not have
the property `engine`.
Add optional chaining to `car2.engine["turn-off"]()`
to make sure that the `["turn-off"]()` method
is only invoked if `car2.engine` exists.

For example:
```js
Input:
car = {
  brand: "Toyota",
  engine: {
    "turn-off": () => console.log("Engine turned off"),
  }
}
car2 = {
  brand: "Honda",
}

Output:
"Engine turned off"
undefined
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const car1 = {
  brand: "Toyota",
  engine: {
    "turn-off": () => console.log("Engine turned off"),
  }
};

const car2 = {
  brand: "Honda",
};

car1.engine["turn-off"]();
car2.engine["turn-off"]();
</code>

<solution>
const car1 = {
  brand: "Toyota",
  engine: {
    "turn-off": () => console.log("Engine turned off"),
  }
};

const car2 = {
  brand: "Honda",
};

car1.engine["turn-off"]();
car2.engine?.["turn-off"]();
</solution>
</codeblock>
