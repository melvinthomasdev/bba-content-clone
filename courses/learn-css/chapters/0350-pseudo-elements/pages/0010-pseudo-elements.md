When you want to apply styles to a
part of an element like the first letter
or first line of a paragraph, or add
some content before or after an element
using CSS, without actually adding
a new element in HTML, you can use
pseudo-elements like `::first-line`,
`::first-letter`, `::before` and `::after`.

Let’s look at some examples below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<p id="intro">
  Dale Carnegie was an American writer and lecturer, and the developer of courses in self-improvement, salesmanship, corporate training, public speaking, and interpersonal skills.
</p>
<h2>Famous Quote:</h2>
<p id="quote">
  Remember, today is the tomorrow you worried about yesterday.
</p>
</panel>
<panel language="css">
p {
  font-size: 1.1rem;
}
#intro::first-letter {
  font-size: 2.5rem;
  color: purple;
}

#quote::before {
  content: '“';
  font-size: 2rem;
  color: purple;
}
</panel>
</code>
</codeblock>

Note that while pseudo-classes
start with a single colon `:`,
pseudo-elements start with a double colon `::`.
