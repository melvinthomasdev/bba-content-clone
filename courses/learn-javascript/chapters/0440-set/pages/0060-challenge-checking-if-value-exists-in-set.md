Use `has()` to check whether
the value **"JS"** is present
in the **skills** set.
Store the result in `isSkilledInJS`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const skills = new Set(["HTML", "CSS", "JS"]);
const isSkilledInJS = ;
console.log(isSkilledInJS);
</code>

<solution>
const skills = new Set(["HTML", "CSS", "JS"]);
const isSkilledInJS = skills.has("JS");
console.log(isSkilledInJS);
</solution>
</codeblock>