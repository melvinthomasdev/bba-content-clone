We can set the attributes for any
HTML element using the `setAttribute`
method.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div>
    <img />
</div>
</panel>
<panel language="css">
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
<panel language="javascript">
let imgElement = document.querySelector('img');
imgElement.setAttribute("src", "https://www.nasa.gov/sites/default/files/thumbnails/image/potw2121a.jpg");
</panel>
</code>
</codeblock>

In the example given above, we are
setting the `src` attribute for
the `img` element. When using `setAttribute`,
we need to provide the property name
and the value of the property.