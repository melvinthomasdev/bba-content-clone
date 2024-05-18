Use the `endsWith()` method to check
whether the value of `filename`
ends with `".js"`.

For example:
```js
Input: filename = "index.md"

Output: false
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const filename = "index.js";
const isJSFile = ;
console.log(isJSFile);
</code>

<solution>
const filename = "index.js";
const isJSFile = filename.endsWith(".js");
console.log(isJSFile);
</solution>
</codeblock>
