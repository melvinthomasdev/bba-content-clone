For the image given below, use the
event handler property `onclick` to
listen for any click events.

When you click on the image, its width
should increase to `300px`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<img src = "shih-tzu-dog-03.jpg">
</img>
</panel>
<panel language="css">
img {
  width: 250px;
  border: 10px solid chocolate;
}
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let imgElement = document.querySelector('img');
imgElement.onclick = () => {
  imgElement.style.width = '300px';
}
</solution>
</codeblock>