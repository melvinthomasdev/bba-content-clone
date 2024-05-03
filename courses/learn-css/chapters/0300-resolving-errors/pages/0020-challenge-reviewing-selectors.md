Review the provided HTML and CSS code.
Identify any issues in the CSS selectors.

Make the necessary corrections to the CSS
code to achieve the following:
- Change the font size of all `<h1>` elements to **24px**.
- Change the text color of all `<p>` elements to **green**.
- Make the text in the paragraph with the id `special-paragraph` **bold**.

Confirm that the visual appearance of the headings
and
paragraphs matches the corrected CSS rules.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1>Welcome to My Website</h1>
<p>Project section</p>
<p id="special-paragraph">Blog section</p>
</panel>
<panel language="css">
h1 {
  font-size: 36px;
}

p {
  color: blue;
}
</panel>
</code>
<solution>
h1 {
  font-size: 24px;
}

p {
  color: green;
}

#special-paragraph {
  font-weight: bold;
}
</solution>
</codeblock>
