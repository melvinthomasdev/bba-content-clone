Pseudo-classes affect the
styling based on user
interaction or element position.

Pseudo-elements can create
new content or style specific
portions of the element's content.

Example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<input type="text" placeholder="Favourite Fruit">
<ul>
    <li>Mango</li>
    <li>Orange</li>
    <li>Apple</li>
    <li>Banana</li>
</ul>
</panel>
<panel language="css">
/* Pseudo-class */
input:focus {
    border-color: green;
}
li:nth-child(even) {
    background-color: lightpink;
    width:100px;
}

li:first-of-type {
    font-weight: bold;
    background-color: lightpink;
}

/* Pseudo-element */
li::marker {
    color: teal;
}

</panel>
</code>
</codeblock>

Here, `:focus` is an
element's state that gets triggered
by user interaction.
`:nth-child` and `:first-of-type`
are element positions.

`::marker` is
targeting a specific part of
the element.