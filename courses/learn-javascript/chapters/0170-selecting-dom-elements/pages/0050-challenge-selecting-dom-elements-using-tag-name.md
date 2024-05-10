In the example given below,
change the width of all `div`
elements to **100px** using
`getElementsByTagName`. Also,
change the text inside every `div` element
to - **Look here**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div></div>
  <p>This is a diversion.</p>
<div></div>
</panel>
<panel language="css">
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
<panel language="javascript">

</panel>
</code>

<solution>
let allDivs = Array.from(document.getElementsByTagName('div'));

allDivs.forEach(div => {
  div.style.width = "100px";
  div.innerText = "Look here";
});

</solution>
</codeblock>