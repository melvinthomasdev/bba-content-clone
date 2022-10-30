In the example given below,
change the width of all `div`
elements to **100px** using
`getElementsByTagName`. Also,
change the text inside every `div` element
to - **Look here**.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<div></div>
  <p>This is a diversion.</p>
<div></div>
</panel>
<panel lang="css">
div {
  padding: 1rem;
  font-size: 1.1rem;
  border: 5px solid;
  border-image-slice: 1;
  border-image-source: linear-gradient(to left, red, mediumblue);
  font-family: Helvetica;
}

p {
  font-family: Helvetica;
}
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let allDivs = document.getElementsByTagName('div');
for (let div of allDivs) {
  div.style.width = "100px";
  div.innerText = "Look here";
}
</solution>
</Editor>