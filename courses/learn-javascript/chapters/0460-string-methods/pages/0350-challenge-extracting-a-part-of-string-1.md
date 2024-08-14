Use the `slice()` method
to extract a substring from
index **4** to **12** of
the value of `email`,
both inclusive.

Store the substring in `organization`.

For example:
```js
Input: email = "eve@example.com"

Output: "example"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const email = "sam@bigbinary.com";
const organization = ;
console.log(organization);
</code>

<solution>
const email = "sam@bigbinary.com";
const organization = email.slice(4, 13);
console.log(organization);
</solution>
</codeblock>
