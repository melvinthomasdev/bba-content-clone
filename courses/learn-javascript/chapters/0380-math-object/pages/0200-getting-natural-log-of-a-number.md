The Math.log function in JavaScript is
used to return the natural logarithm
of a number.

Syntax
```js
Math.log(x)
```

<codeblock language="javascript" type="lesson">
<code>
console.log(Math.log(1));
console.log(Math.log(10));
console.log(Math.log(0));
console.log(Math.log(-1));
console.log(Math.log(-3));
</code>
</codeblock>

From the code above code,
we can see that the output
for any negative number is `NaN`
and
for **0** is `-Infinity`.

This is the reason it is preferred
to use a positive number as a parameter
to the `Math.log()` method.
