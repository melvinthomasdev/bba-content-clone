Regular expression to match
any digits - **0** to **9**
is `\d`.

Syntax:
```js
\d - Matches a single digit
\d+ - Matches one or more consecutive digits
```

<codeblock language="javascript" type="lesson">
<code>
// Matching a single digit
const regex1 = /\d/;
console.log(regex1.test('5'));
console.log(regex1.test('a'));

// Matching one or more consecutive digits
const regex2 = /\d+/;
console.log("regex123".match(regex2));
console.log('abc123'.match(regex2));
console.log(regex2.test('x'));
</code>
</codeblock>
