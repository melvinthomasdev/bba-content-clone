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
const isJavaScriptFile = ;
console.log(isJavaScriptFile);
</code>

<solution>
const filename = "index.js";
const isJavaScriptFile = filename.endsWith(".js");
console.log(isJavaScriptFile);
</solution>
</codeblock>
