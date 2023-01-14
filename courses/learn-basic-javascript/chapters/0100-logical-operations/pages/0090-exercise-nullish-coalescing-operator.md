In the example given below,
`user2` does not have
the property `noOfAttempts`,
which causes an unwanted output
when `totalNoOfAttempts - user2.noOfAttempts`
is executed.

Use the `??` operator to use
the default value
of the `noOfAttempts` as `0`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const totalNoOfAttempts = 5;

const user1 = {
  name: "Sam Smith",
  noOfAttempts: 3,
};

const user2 = {
  name: "Oliver Smith",
};

console.log(`${user1.name} has ${totalNoOfAttempts - user1.noOfAttempts} attempts left.`);
console.log(`${user2.name} has ${totalNoOfAttempts - user2.noOfAttempts} attempts left.`);
</code>

<solution>
const totalNoOfAttempts = 5;

const user1 = {
  name: "Sam Smith",
  noOfAttempts: 3,
};

const user2 = {
  name: "Oliver Smith",
};

console.log(`${user1.name} has ${totalNoOfAttempts - (user1.noOfAttempts ?? 0)} attempts left.`);
console.log(`${user2.name} has ${totalNoOfAttempts - (user2.noOfAttempts ?? 0)} attempts left.`);
</solution>
</codeblock>