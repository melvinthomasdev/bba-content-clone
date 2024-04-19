Use the **startsWith()** method to
check if **emailAddress1**
and
**emailAddress2** start with the
substring **info@**. Use the **startsWith()**
method again to see if **file1** and **file2**
start with the substring **image-**.

For example:
```js
Input:
emailAddress = "sam@example.com"
file = "image-funny-cat.png"

Output:
false
true
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const emailAddress1 = "info@example.com";
const emailAddress2 = "helpdesk@example.com";

const file1 = "image-of-taj-mahal.png";
const file2 = "funny-cat.png";

const isInfoEmail1 =
const isInfoEmail2 =

const startsWithImage1 =
const startsWithImage2 =

console.log(isInfoEmail1);
console.log(isInfoEmail2);
console.log(startsWithImage1);
console.log(startsWithImage2);
</code>

<solution>
const emailAddress1 = "info@example.com";
const emailAddress2 = "helpdesk@example.com";

const file1 = "image-of-taj-mahal.png";
const file2 = "funny-cat.png";

const isInfoEmail1 = emailAddress1.startsWith("info@");
const isInfoEmail2 = emailAddress2.startsWith("info@");

const startsWithImage1 = file1.startsWith("image-");
const startsWithImage2 = file2.startsWith("image-");

console.log(isInfoEmail1);
console.log(isInfoEmail2);
console.log(startsWithImage1);
console.log(startsWithImage2);
</solution>
</codeblock>
