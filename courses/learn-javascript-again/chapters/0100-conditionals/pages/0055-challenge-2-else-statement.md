In this code, we are provided with
details of a participant.

Your task is to modify the code
to achieve the following
console log output:

If the participant has the role
of `admin`, the message should be:
`[Participant Name] has access to the admin area.`.

If the participant has a different role,
the message should be:
`[Participant Name] has access to the public area.`

For example:
```js
Input:
participant = {
  name: "Sam",
  role: "admin"
}

Output: "Sam has access to the public area."
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const participant = {
  name: "Tommy",
  role: "guest"
};

// Write code below
</code>

<solution>
const participant = {
  name: "Tommy",
  role: "guest"
};

// Write code below
if (participant.role === "admin") {
  console.log(`${participant.name} has access to admin area.`)
} else {
  console.log(`${participant.name} has access to the public area.`)
};
</solution>
</codeblock>
