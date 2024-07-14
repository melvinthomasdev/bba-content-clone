Range operations allow us to specify
a range of characters or numbers to
match within a pattern.

This is achieved by using square
brackets `[ ]` along with a hyphen
`-` to indicate the range.

Syntax:
```js
[start-end]
```

<codeblock language="javascript" type="lesson">
<code>
const regex1 = /[a-z]/;
console.log("regex123".match(regex1));

const regex2 = /[A-Z]/;
console.log('z'.match(regex2));

const regex3 = /[0-9]/;
console.log(regex3.test('7'));
</code>
</codeblock>
