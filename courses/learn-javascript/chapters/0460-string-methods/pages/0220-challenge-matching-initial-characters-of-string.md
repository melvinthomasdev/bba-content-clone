Use the `startsWith()` method to check whether
the value of `url` starts with `"https://"`.

For example:
```js
Input: url = "bigbinary.com"

Output: false
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const url = "https://bigbinaryacademy.com/";
const isSecureUrl = ;
console.log(isSecureUrl);
</code>

<solution>
const url = "https://bigbinaryacademy.com/";
const isSecureUrl = url.startsWith("https://");
console.log(isSecureUrl);
</solution>
</codeblock>