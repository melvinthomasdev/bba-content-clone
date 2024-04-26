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
Array.isArray([1, 2, 3]);                     // true
Array.isArray({});                            // false
Array.isArray("hello");                       // false
Array.isArray(123);                           // false
Array.isArray(new Array("a", "b", "c", "d")); //true
</code>
</codeblock>
