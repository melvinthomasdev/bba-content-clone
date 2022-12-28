Similar to other languages, CSS comments are ignored by the browser. You can add comments in CSS to explain the code to yourself or other developers where needed.

CSS comments start with `/*` and end with `*/`. They can be single line or span across multiple lines.

<codeblock language="css" type="lesson">
<code>
/* This is a comment */

/* Here is a
multi-line comment */

body {
  /* background-color: yellow; */
}
</code>
</codeblock>

You don't see the background color applied to the page because it is within comments, ignored by the browser. Try removing `/*` and `*/` around the rule `background-color: yellow` to see what happens.