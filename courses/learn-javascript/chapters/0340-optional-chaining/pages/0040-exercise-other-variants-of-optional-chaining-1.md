The following code throws an error
because `car2.engine` does not have
the method `start`.
Add optional chaining to `car2.engine.start()`
so that the `start` method
is only invoked if it exists.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const car1 = {
  brand: "Toyota",
  engine: {
    start: () => console.log("Engine started"),
  }
};

const car2 = {
  brand: "Honda",
  engine: {}
};

car1.engine.start();
car2.engine.start();
</code>

<solution>
const car1 = {
  brand: "Toyota",
  engine: {
    start: () => console.log("Engine started"),
  }
};

const car2 = {
  brand: "Honda",
  engine: {}
};

car1.engine.start();
car2.engine.start?.();
</solution>
</codeblock>
