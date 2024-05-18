The `isArray()` method in JavaScript
is a built-in function used to determine
whether a given value is an array.

It returns **true** if the value is an array,
and **false** otherwise.

Syntax:
```js
Array.isArray(value)
```

<codeblock language="javascript" type="lesson">
<code>
console.log(Array.isArray([1, 2, 3]));                     // true
console.log(Array.isArray({}));                            // false
console.log(Array.isArray("hello"));                       // false
console.log(Array.isArray(123));                           // false
console.log(Array.isArray(new Array("a", "b", "c", "d"))); //true
</code>
</codeblock>
