Create a program `getAbbreviation` that
accepts a parameter `name` which will be
a string consisting of a full-name and
returns abbreviated version of the name.
For example:
`Albert Einstein` when provided should
return `Albert E.`

Create another program `getMaskedEmail` 
that accepts a parameter `email` and
outputs the masked version of the email,
where we can see the first 3 characters
in the email and the domain.

For example:
`albert.einstein@gmail.com` when provided
should return `alb...@gmail.com`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here.
</code>

<solution>
const getAbbreviation = (fullName) => {
  const nameArray = fullName.split(" ");
	return `${nameArray[0]} ${nameArray[1].charAt(0)}.`
};

const getMaskedEmail = (email) => {
	return `${email.slice(0,3)}...${email.slice(email.indexOf('@'))}`
};
</solution>
<testcases>
<caller>
console.log(getAbbreviation(newName));
console.log(getMaskedEmail(newEmail));
</caller>
<testcase>
<i>
const newName = "Stephen King";
const newEmail = "stephen.king@gmail.com";
</i>
</testcase>
<testcase>
<i>
const newName = "James Cameron";
const newEmail = "james.cameron@gmail.com";
</i>
</testcase>
</testcases>
</codeblock>
