Update the properties of the `bird` object,
as per the table given below.

Use **bracket notation** to update the object.

| Key               | Value |
| ----------------- | ----- |
| "can fly"         | false |
| "number-of-claws" | 3     |

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const bird = {
  type: "owl",
  "can fly": true,
  "number-of-claws": 5
};

console.log(bird);
</code>

<solution>
const bird = {
  type: "owl",
  "can fly": true,
  "number-of-claws": 5
};

bird["can fly"] = false;
bird["number-of-claws"] = 3;

console.log(bird);
</solution>
</codeblock>