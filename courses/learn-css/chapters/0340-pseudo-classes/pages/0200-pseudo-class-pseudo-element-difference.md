Pseudo-classes select elements
based on their state.

Pseudo-elements select specific
parts of an element or insert
additional content.

Example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>Get our browser on all your devices.</h2>
<p>Search and browse more privately with our browser. Unlike other browsers, we don't track you.</p>
</panel>
<panel language="css">
/* Pseudo-class */
h2:hover {
    background-color: blue;
    color: white;
}

/* Pseudo-element */
p::first-line {
    font-weight: bold;
}

p::before {
    content: "Download it Now: ";
    color: purple;
}
</panel>
</code>
</codeblock>

Here, `:hover` is an element's state.
`::first-line` is
targeting a part of the element.
`::before` inserts additional
content.