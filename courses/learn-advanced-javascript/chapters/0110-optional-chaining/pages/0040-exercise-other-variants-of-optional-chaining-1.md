The following code throws an error
because `bird2.actions` does not have
the method `sing`.
Add optional chaining to `bird2.actions.sing()`
so that the `sing` method
is only invoked if it exists.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird1 = {
  name: "Sparrow",
  actions: {
    sing: () => console.log("Chirp chirp"),
  }
};

const bird2 = {
  name: "Humming Bird",
  actions: {}
};

bird1.actions.sing();
bird2.actions.sing();
</code>

<solution>
const bird1 = {
  name: "Sparrow",
  actions: {
    sing: () => console.log("Chirp chirp"),
  }
};

const bird2 = {
  name: "Humming Bird",
  actions: {}
};

bird1.actions.sing();
bird2.actions.sing?.();
</solution>
</codeblock>