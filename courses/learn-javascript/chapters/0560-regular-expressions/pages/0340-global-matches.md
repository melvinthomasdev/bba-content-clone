The `g` modifier, or global flag,
allows the regular expression
pattern to match all occurrences
of the pattern in a string,
instead of stopping after
the first match.

This is added at the end of
our regular expression pattern.

Syntax:
```js
const regex = /pattern/g;
```

<codeblock language="javascript" type="lesson">
<code>
const text = "hello world, hello universe";

const regexWithoutGFlag = /hello/;
const matchesWithoutGFlag = text.match(regexWithoutGFlag);
console.log(matchesWithoutGFlag);

const regexWithGFlag = /hello/g;
const matchesWithGFlag = text.match(regexWithGFlag);
console.log(matchesWithGFlag);
</code>
</codeblock>

In the above code, a variable named
`regexWithoutGFlag` is declared
and
assigned a regular expression `/hello/`.

This regular expression is designed
to match the substring `hello` within
a string.

Note that this regex does not have any
flags like `g` or `i` , or m.
By default, it will only match the first
occurrence of `hello`.
and
we see the output:
["hello"]

For `regexWithGFlag` a regular expression
`/hello/g` is assigned.

Since the regex has the `g` flag,
match will return an array with all the occurrences
of `hello` found in the text string
and
we see the output:
["hello", "hello"]
