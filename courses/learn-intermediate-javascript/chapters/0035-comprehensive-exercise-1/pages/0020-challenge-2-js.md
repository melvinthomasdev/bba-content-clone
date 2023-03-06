- Given is a name and and email:
  - Name = Albert Einstein
  - Email = albert.einstein@gmail.com

- Write a program such that it takes these name and gives it's abbreviated form.
`Albert E.`
- Also write a program that takes the email and gives a masked version of it.
`albe...@gmail.com`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here.
</code>

<solution>
const abbreviation = (fullName) => {
const nameArray = fullName.split(" ");
	return `${nameArray[0]} ${nameArray[1].charAt(0)}.`
};

const maskedEmail = (email) => {
	return `${email.slice(0,4)}...${email.slice(email.indexOf('@'))}`
}

const name = "Albert Einstein";
const email = "albert.einstein@gmail.com";

abbreviation(name);
maskedEmail(email);
</solution>
<testcases>
<caller>
console.log(abbreviation(newName));
console.log(maskedEmail(newEmail));
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
