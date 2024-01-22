In the code below,
if the `user` is logged in
and
has permission,
log to the console:
`Access granted.`

Else, log the following:
`Access denied.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const user = {
  name: "Sam",
  isLogged: true,
  hasPermission: true
}
// Write code below
</code>

<solution>
const user = {
  name: "Sam",
  isAdmin: false,
  isModerator: false
}
// Write code below
if (user.isLogged && user.hasPermission) {
  console.log("Access granted.");
} else {
  console.log("Access denied.");
};
</solution>
</codeblock>
