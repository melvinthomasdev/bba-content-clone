The following code throws an error
because `bird2` does not have
the property `actions`.
Add optional chaining to `bird2.actions["make-sound"]()`
to make sure that the `["make-sound"]()` method
is only invoked if `bird2.actions` exists.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const bird1 = {
  name: "Sparrow",
  actions: {
    "make-sound": () => console.log("Chirp chirp"),
  }
}

const bird2 = {
  name: "Humming Bird",
}

bird1.actions["make-sound"]();
bird2.actions["make-sound"]();
</code>

<solution>
const bird1 = {
  name: "Sparrow",
  actions: {
    "make-sound": () => console.log("Chirp chirp"),
  }
}

const bird2 = {
  name: "Humming Bird",
}

bird1.actions["make-sound"]();
bird2.actions?.["make-sound"]();
</solution>
</codeblock>