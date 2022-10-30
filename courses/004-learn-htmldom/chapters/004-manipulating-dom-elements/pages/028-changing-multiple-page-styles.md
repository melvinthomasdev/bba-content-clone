With the `style` property, we can only
change a single style property at a time.
For changing multiple style properties
together, we need to use the `style.cssText`
property.

Let's try changing the `width` and
`font-size` of
this square `div`:

<Editor lang="javascript">
<code>
<panel lang="html">
<div>Hello</div>
</panel>
<panel lang="css">
div {
    width: 300px;
    height: 250px;
    background-color: palevioletred;
    font-family: Arial;
    font-size: 3rem;
}
</panel>
<panel lang="javascript">
let squareDiv = document.querySelector('div');
squareDiv.style.cssText = 'width: 250px; font-weight: 700';
</panel>
</code>
</Editor>

As you can see, in this property
we can simply write CSS the way
we normally write it, with hyphens
in long property names.