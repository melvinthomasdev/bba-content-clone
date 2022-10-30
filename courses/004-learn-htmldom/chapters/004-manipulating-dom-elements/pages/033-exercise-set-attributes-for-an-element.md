Set the `src` attribute of the image
element with the value `https://www.nasa.gov/sites/default/files/thumbnails/image/stsci-h-p2109c-m-2000x1125.png`

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<img />
</panel>
<panel lang="css">
img {
    width: 300px;
    border: 10px solid steelblue;
    display: block;
    margin: 1rem auto;
}
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let imgElement = document.querySelector('img');
imgElement.src = "https://www.nasa.gov/sites/default/files/thumbnails/image/stsci-h-p2109c-m-2000x1125.png";
</solution>
</Editor>