For the image given below, use the
event handler property `onclick` to
listen for any click events.

When you click on the image, its width
should increase to `300px`.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<img src = "shih-tzu-dog-03.jpg">
</img>
</panel>
<panel lang="css">
img {
  width: 250px;
  border: 10px solid chocolate;
}
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let imgElement = document.querySelector('img');
imgElement.onclick = () => {
  imgElement.style.width = '300px';
}
</solution>
</Editor>