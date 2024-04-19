Update the code in such a way that
it logs the following to the console:

- If the participant is `admin`:
`[Participant Name] has access to admin area.`
- If the participant is `volunteer`:
`[Participant Name] has access to staff area.`
- Else log the following:
`[Participant Name] has access to public area.`

For example:
```js
Input:
participant = {
  name: "Eve",
  role: "admin"
}

Output: "Eve has access to admin area."
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const participant = {
  name: "Sam",
  role: "volunteer"
};

// Write code below
</code>

<solution>
const participant = {
  name: "Sam",
  role: "volunteer"
};

// Write code below
if (participant.role === "admin") {
  console.log(`${participant.name} has access to admin area.`);
} else if (participant.role === "volunteer"){
  console.log(`${participant.name} has access to staff area.`);
}
else {
  console.log(`${participant.name} has access to public area.`);
};
</solution>
</codeblock>
