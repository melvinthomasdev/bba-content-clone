Add the properties given in the table below
to the `person` object.

Use **bracket notation** to add the properties.

| Key | Value    |
| --- | -------- |
| 13  | Samantha |
| 14  | Oliver   |

<Editor lang="javascript" type="exercise">
<code>
let person = {
  12: "Adam"
};

console.log(person);
</code>

<solution>
let person = {
  12: "Adam"
};

person[13] = "Samantha";
person[14] = "Oliver";

console.log(person);
</solution>
</Editor>