The `Math.ceil` method rounds a number.

For example, `2.1` is rounded up to `3`:

<codeblock language="javascript" type="lesson">
<code>
const length = 2.1;

console.log(Math.ceil(length));

console.log(Math.round(length));
</code>
</codeblock>

While `Math.round` finds
the nearest integer
to the value passed to it,
`Math.ceil` finds the nearest integer
that is greater than
the value passed to it.

In the example given above,
the nearest integer to `2.1` is `2`.
Hence we get the output `2`
for `Math.round(2.1)`.

However, even if `2`
is the nearest integer to `2.1`,
the value `2` is lesser than `2.1`.
Since `Math.ceil(2.1)` will only
return a value greater than `2.1`,
we get the next nearest integer,
i.e., `3` as the output.
