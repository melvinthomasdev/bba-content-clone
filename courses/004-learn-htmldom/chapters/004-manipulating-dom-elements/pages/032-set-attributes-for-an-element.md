We can set the attributes for any
HTML element using the `setAttribute`
method.

<Editor lang="javascript">
<code>
<panel lang="html">
<div>
    <img />
</div>
</panel>
<panel lang="css">
div {
    width: 300px;
    min-height: 200px;
    border: 10px solid palevioletred;
    margin: 1rem auto;
}

img {
    width: 100%;
    display: block;
}
</panel>
<panel lang="javascript">
let imgElement = document.querySelector('img');
imgElement.setAttribute("src", "https://www.nasa.gov/sites/default/files/thumbnails/image/potw2121a.jpg");
</panel>
</code>
</Editor>

In the example given above, we are
setting the `src` attribute for
the `img` element. When using `setAttribute`,
we need to provide the property name
and the value of the property.