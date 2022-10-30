<!-- Styles not visible in the console output of the object properties -->
We can change the styling of an HTML
element using the `style` property.

<Editor lang="javascript">
<code>
<panel lang="html">
<h1>Check out the style</h1>
</panel>
<panel lang="css">
h1 {
    font-family: Helvetica;
    font-size: 3rem;
    color: navy;
}
</panel>
<panel lang="javascript">
console.log(document.querySelector('h1').style);
</panel>
</code>
</Editor>

If you look at the console, you'll
see that all the different style properties
that you see inside the `CSSStyleDeclaration` are
in the camel case. This is different from how we
write them in CSS, separated by a hyphen.

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
}
</panel>
<panel lang="javascript">
let squareDiv = document.querySelector('div');
squareDiv.style.width = '250px';
squareDiv.style.fontSize = '64px';
</panel>
</code>
</Editor>