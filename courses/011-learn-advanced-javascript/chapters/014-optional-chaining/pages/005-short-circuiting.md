When we use optional chaining `?.`,
the execution stops
if the value before `?.` does not exist or is **null**.
It does not evaluate the value that is after `?.`. This is
called **short-circuiting**

<Editor lang="javascript">
<code>
let user = null;
let x  = 0;

user?.(x++);
console.log(x);
</code>
</Editor>

In the example given above,
**user** is **null**.
Therefore, `?.` skips the evaluation of `x++`
and
the value of **x** remains **0**.