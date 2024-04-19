Add a `finally` block
to the code given below,
that displays the message
**"Loading complete"**
regardless of if there was an error
in the `try` block or not.

```js
Output:
"Loading profile..."
"Loaded undefined's profile"
"Loading complete"
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
try {
  console.log("Loading profile...");

const profile = {
firstName: "Adam",
lastName: "Smith",
age: 32,
};

console.log(`Loaded ${user.firstName}'s profile`);
} catch (err) {
console.log("Error loading the profile");
}

</code>

<solution>
try {
  console.log("Loading profile...");

const profile = {
firstName: "Adam",
lastName: "Smith",
age: 32,
};

console.log(`Loaded ${user.firstName}'s profile`);
} catch (err) {
console.log("Error loading the profile");
} finally {
console.log("Loading complete");
}

</solution>
</codeblock>
