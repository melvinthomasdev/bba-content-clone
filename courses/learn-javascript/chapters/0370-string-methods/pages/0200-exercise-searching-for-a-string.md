Use the `includes()` method to check
if the substring `"React"`
is present in the `languageStack` variable.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const languageStack = "MongoDB Express React Node";
const hasReact = ;
console.log(hasReact);
</code>

<solution>
const languageStack = "MongoDB Express React Node";
const hasReact = languageStack.includes("React");
console.log(hasReact);
</solution>
</codeblock>