Given below is the
name of a person:

```
Paul Thomas Anderson
```

Write a program which will
print his name in the
following format:

```
P.T.Anderson
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const name = "Paul Thomas Anderson"
</code>

<solution>
const name = "Paul Thomas Anderson";

// split name and assign
const [firstName, middleName, lastName] = name.split(" ");

const firstLetterOfFirstName = firstName[0];
const firstLetterOfMiddletName = middleName[0];

// Print
console.log(`${firstLetterOfFirstName}.${firstLetterOfMiddletName}.${lastName}`);
</solution>
</codeblock>