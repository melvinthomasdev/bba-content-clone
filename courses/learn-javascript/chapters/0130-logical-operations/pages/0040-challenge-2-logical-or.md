In the code below,
if the `user` is an
admin or a moderator,
log to the console:
`[User name] has special privileges.`

If not, log to the console:
`[User name] has standard privileges.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const user = {
  name: "Sam",
  isAdmin: false,
  isModerator: false
};
// Write code below
</code>

<solution>
const user = {
  name: "Sam",
  isAdmin: false,
  isModerator: false
};
// Write code below

if (user.isAdmin || user.isModerator) {
  console.log(`${user.name} has special privileges.`);
} else {
  console.log(`${user.name} has standard privileges.`);
};
</solution>
</codeblock>
