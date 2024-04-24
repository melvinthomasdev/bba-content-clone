Use the `map()` method
to append **"@example.com"**
to the end of each element
of the `usernames` array
and store the result in `emails`.

For example:
```js
Input: ["eve.smith", "sam", "linh"]

Output: ["eve.smith@example.com", "sam@example.com", "linh@example"]
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const usernames = ["sam.smith", "oliver", "adamSmith"];
const emails = ;
console.log(emails);
</code>

<solution>
const usernames = ["sam.smith", "oliver", "adamSmith"];
const emails = usernames.map(username => `${username}@example.com`);
console.log(emails);
</solution>
</codeblock>
