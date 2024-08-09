For pseudo-classes, we use
the single colon `:` sign.
For pseudo-elements, we use
the double colon `::` sign.

Example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">

<input type="text" value="Disabled" disabled>
<input type="text" value="Enabled">
<h1>Mobile Screen Glare</h1>
<p>The glare from the mobile screens can cause strain on your eyes.</p>

</panel>
<panel language="css">
/* Pseudo-class */
input:disabled {
background-color: lightgray;
}

/* Pseudo-element */
p::selection {
background: yellow;
}
</panel>
</code>
</codeblock>

Select the paragraph to
see the `selection` pseudo-element
in action.