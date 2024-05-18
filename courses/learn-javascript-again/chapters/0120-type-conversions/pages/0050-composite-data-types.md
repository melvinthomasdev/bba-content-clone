Let's take a look at the results
we get when we use `typeof`
with composite data types:

<codeblock language="javascript" type="lesson">
<code>
console.log(typeof { name: "This is an object" });
console.log(typeof ["This", "is", "an", "array"]);
console.log(typeof new Date());
console.log(typeof new Map());
</code>
</codeblock>

From the example given above,
we can see that,
when we use `typeof` with
any composite data type,
we get the output **"object"**.

Note that,
when we use `typeof` with `null`
we get the output as **"object"**.

<codeblock language="javascript" type="lesson">
<code>
console.log(typeof null);
</code>
</codeblock>