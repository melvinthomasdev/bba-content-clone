In the example given below,
change the background colour of
all the `div` elements to be
**teal**. Then, change the
background colour of the eighth `div`
element to be **olive**. For
selecting the `div` elements, only use
`getElementsByTagName`.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<section>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</section>
</panel>
<panel lang="css">
section {
  display: flex;
  padding: 1rem 10rem;
}

div {
  width: 100px;
  height: 100px;
  border: 5px dotted black;
  margin-left: -90px;
  box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;
}
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let allSquares = document.getElementsByTagName('div');
for (let square of allSquares) {
  square.style.backgroundColor = "teal";
}
allSquares[7].style.backgroundColor = "olive";
</solution>
</Editor>