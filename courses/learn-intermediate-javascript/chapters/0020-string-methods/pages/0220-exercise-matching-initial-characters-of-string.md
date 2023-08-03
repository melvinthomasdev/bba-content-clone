Use the `startsWith()` method to check whether
the value of `url` starts with `"https://"`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const url = "https://academy.bigbinary.com/";
const isSecureUrl = ;
console.log(isSecureUrl);
</code>

<solution>
const url = "https://academy.bigbinary.com/";
const isSecureUrl = url.startsWith("https://");
console.log(isSecureUrl);
</solution>
</codeblock>