Use `has()` to check whether
the value **"JavaScript"** is present
in the **skills** set.
Store the result in `isSkilledInJavaScript`.

For example:
```js
Input:
skills = new Set(["HTML", "CSS", "PYTHON"])

Output:
false
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const skills = new Set(["HTML", "CSS", "JavaScript"]);
const isSkilledInJavaScript = ;
console.log(isSkilledInJavaScript);
</code>

<solution>
const skills = new Set(["HTML", "CSS", "JavaScript"]);
const isSkilledInJavaScript = skills.has("JavaScript");
console.log(isSkilledInJavaScript);
</solution>
</codeblock>
