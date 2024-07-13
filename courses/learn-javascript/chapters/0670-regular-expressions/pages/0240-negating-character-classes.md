Sometimes we need to avoid matching 
a specified character. For this, 
we use `[^ ]`.

Syntax:
```js
[^ ]
```

Take a look at this example:

<codeblock language="javascript" type="lesson">
<code>
const regex = /[^aeiou]/;
const text = "hello123";
console.log(regex.test(text)); // Output: true (matches 'h')
</code>
</codeblock>
