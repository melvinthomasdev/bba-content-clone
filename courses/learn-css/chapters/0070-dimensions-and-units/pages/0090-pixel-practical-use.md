Pixels are great for defining
size for elements which should not
change according to screen sizes.

Take a look at the following example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Coccinella_in_Parc_du_Bois-de-Coulonge_uncut_version.jpg/761px-Coccinella_in_Parc_du_Bois-de-Coulonge_uncut_version.jpg" alt="insect on a flower">
</div>
</panel>
<panel language="css">
img {
    width: 300px;
}
</panel>
</code>
</codeblock>

Providing a fixed width to an image
helps us control the size of the image
so that it doesn't grow beyond a certain
extent.