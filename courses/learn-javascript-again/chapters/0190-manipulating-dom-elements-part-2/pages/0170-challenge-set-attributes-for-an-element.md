Set the `src` attribute of the image
element with the value `https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Torhaus_der_Mainbr%C3%BCcke_in_Miltenberg.jpg/512px-Torhaus_der_Mainbr%C3%BCcke_in_Miltenberg.jpg`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img>
</panel>
<panel language="css">
img {
  width: 300px;
  display: block;
  margin: 1rem auto;
  box-shadow: 0px 0px 10px 10px peachpuff;
  border-radius: 50%;
}
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let imgElement = document.querySelector('img');
imgElement.setAttribute("src", "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Torhaus_der_Mainbr%C3%BCcke_in_Miltenberg.jpg/512px-Torhaus_der_Mainbr%C3%BCcke_in_Miltenberg.jpg");
</solution>
</codeblock>
