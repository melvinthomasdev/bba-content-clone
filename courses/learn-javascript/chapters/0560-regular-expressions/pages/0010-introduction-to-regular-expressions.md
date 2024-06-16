Regular expressions also commonly known as `regex` or `regexp`, are sequences of characters that define a search pattern.

They are used to match patterns within strings and are invaluable tools for text processing and manipulation.

Regular expressions can be used with string methods. The method `regexp.test(stringValue)` checks if there is at least one match in the string **stringValue**. If a match is found, it returns `true`, otherwise it returns `false`.

In regex, for matching exact characters, we can use the syntax `/.../`.

Let's consider a simple example where we want to check if a string contains the word `shells`.

<codeblock language="javascript" type="lesson">
<code>
const text = "She sells seashells by the seashore and shells.";
const regex = /shells/;

const match = regex.test(text);

console.log(match);
</code>
</codeblock>

Similarly, the string.match() method can be used to find all matches of a regular expression in a string.
Let's consider an example where we want to find all occurrences of the word apple in a string:

<codeblock language="javascript" type="lesson">
<code>
const text = "She sells seashells by the seashore and shells.";
const regex = /shells/;

const match = text.match(regex);

console.log(match);
</code>
</codeblock>