The variables **greeting** and **reply** hold
messages with unnecessary spaces at the
beginning and end.

- Use the **trim()** method to
  remove these extra spaces
  and store the result in
  the variables **trimmedGreeting**
  and **trimmedReply**.

- Find the number of extra spaces
  removed after trimming in both
  messages and store the results
  in the variables
  **spacesRemovedInGreeting** and
  **spacesRemovedInReply**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const greeting = "    Hello, how are you today?   ";
const reply = "    I am doing great, thank you!   ";

const trimmedGreeting =
const trimmedReply =

const spacesRemovedInGreeting =
const spacesRemovedInReply =

console.log(trimmedGreeting);
console.log(trimmedReply);

console.log(`We removed ${spacesRemovedInGreeting} extra spaces from greeting and ${spacesRemovedInReply} extra spaces from reply.`);
</code>

<solution>
const greeting = "    Hello, how are you today?   ";
const reply = "    I am doing great, thank you!   ";

const trimmedGreeting = greeting.trim();
const trimmedReply = reply.trim();

const spacesRemovedInGreeting = greeting.length - trimmedGreeting.length;
const spacesRemovedInReply = reply.length - trimmedReply.length;

console.log(trimmedGreeting);
console.log(trimmedReply);

console.log(`We removed ${spacesRemovedInGreeting} extra spaces from greeting and ${spacesRemovedInReply} extra spaces from reply.`);
</solution>
</codeblock>
