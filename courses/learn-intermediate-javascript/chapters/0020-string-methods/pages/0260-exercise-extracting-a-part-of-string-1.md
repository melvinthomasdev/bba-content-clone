Use the `slice()` method to extract a substring from index **4** to **10** of the value of `email`,
both inclusive.
Store the substring in `organization`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const email = "sam@example.com";
const organization = ;
console.log(organization);
</code>

<solution>
const email = "sam@example.com";
const organization = email.slice(4, 11);
console.log(organization);
</solution>
</codeblock>