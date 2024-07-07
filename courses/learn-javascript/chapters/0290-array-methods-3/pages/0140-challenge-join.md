Use the `join()` method
to join all the elements of `pathSegments` array,
separated by `"/"`.
Store the returned string
in the `filePath` variable.

```js
Output:
"Users/username/documents/index.js"
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const pathSegments = ["Users", "username", "documents", "index.js"];
const filePath = ;
console.log(filePath);
</code>

<solution>
const pathSegments = ["Users", "username", "documents", "index.js"];
const filePath = pathSegments.join("/");
console.log(filePath);
</solution>
</codeblock>
