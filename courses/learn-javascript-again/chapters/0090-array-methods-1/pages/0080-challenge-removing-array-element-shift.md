Remove the first element of the array `iceCreams`.

```js
Output:
["Vanilla", "Cookie Dough"]
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const iceCreams = ["Cookies and Cream", "Vanilla", "Cookie Dough"];

console.log(iceCreams);
</code>

<solution>
const iceCreams = ["Cookies and Cream", "Vanilla", "Cookie Dough"];
iceCreams.shift();

console.log(iceCreams);
</solution>
</codeblock>
