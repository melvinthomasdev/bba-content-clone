Use the `assoc` function to change the `firstName` to `Oliver`.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const user = {
  id: 1,
  firstName: "Sam",
  address: {
    city: "Miami",
    pin: 111111,
  }
};

console.log(R.assoc()); //Complete the assoc function.
</code>

<solution>
const user = {
  id: 1,
  firstName: "Sam",
  address: {
    city: "Miami",
    pin: 111111,
  }
};

console.log(R.assoc("firstName", "Oliver", user));
</solution>
</codeblock>
