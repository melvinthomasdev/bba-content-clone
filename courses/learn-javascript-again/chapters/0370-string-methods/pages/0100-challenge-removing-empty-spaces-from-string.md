Use the `trim()` method
to remove the
trailing spaces
from the string stored in
the `message` variable.

For example:
```js
Input: message = "    Good Morning!"

Output: "Good Morning!"
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const message = "    Are you available for a call?";
console.log(message);
</code>

<solution>
const message = "    Are you available for a call?";
console.log(message.trim());
</solution>
</codeblock>
