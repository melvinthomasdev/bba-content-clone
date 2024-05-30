The asterisk `*` quantifier is used
to match **zero** or more occurrences
of the preceding character or group.

It's a powerful tool for specifying
patterns where you want to match
repetitions of a certain character or group,
including the possibility of no occurrences.

<codeblock language="javascript" type="lesson">
<code>
const text = "hello";

const regexWithPlus = /hello\w+/;
console.log(text.match(regexWithPlus));

const regexWithAsterisk = /hello\w*/;
console.log(text.match(regexWithAsterisk));

</code>
</codeblock>

In the above code, a regular expression
`regexWithPlus` is set to match the exact
string `hello` followed by **one** or more
word characters, defined
by the pattern `hello\w+`.

Since the `text` string does not contain
any additional word characters after **hello**,
the `match()` method does not find a match.

The output is **null**, indicating that
no match was found.

For `regexWithAsterisk`,
regular expression `hello\w*` is defined
is designed to match the exact string `hello`
followed by **zero** or more word characters.

Since the text string contains `hello`
and
is followed by zero word characters,
the `match()` method finds a match.

The output is an array containing the match:
["hello"]
