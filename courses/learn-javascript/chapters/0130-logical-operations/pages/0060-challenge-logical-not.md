Write an `if` statement,
that displays **"Who are you?"**
if the value of
the variable `personName`
is `""`, provided that
the value of `personName`
will always be
of the type string.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const personName = "";
</code>

<solution>
const personName = "";

if (!personName) {
  console.log("Who are you?");
}
</solution>
</codeblock>
