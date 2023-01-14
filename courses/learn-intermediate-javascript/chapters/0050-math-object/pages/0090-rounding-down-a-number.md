The `Math.floor` method rounds down a number.

For example,
`2.9` is rounded down to `2`:

<codeblock language="javascript" type="lesson">
<code>
const length = 2.9;

console.log(Math.floor(length));

console.log(Math.round(length));
</code>
</codeblock>

While `Math.round` finds
the nearest integer
to the value passed to it,
`Math.floor` finds the nearest integer
that is lesser than
the value passed to it.

In the example given above,
the nearest integer to `2.9` is `3`.
Hence we get the output `3`
for `Math.round(2.9)`.

However, even if `3`
is the nearest integer to `2.9`,
the value `3` is greater than `2.9`.
Since `Math.floor(2.9)` will only
return a value lesser than `2.9`,
we get the next nearest integer,
i.e., `2` as the output.
