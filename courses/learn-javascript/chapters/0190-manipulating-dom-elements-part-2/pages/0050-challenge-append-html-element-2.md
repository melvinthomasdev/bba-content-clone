Move the circular `div` inside
the square `div` using the
`appendChild` method.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<section class="container">
  <div id="square-div"></div>
  <div id="circular-div"></div>
</section>
</panel>
<panel language="css">
.container {
  display: flex;
  align-items: center;
  gap: 1rem;
}

#square-div {
  height: 200px;
  width: 200px;
  background-color: mediumvioletred;
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
}

#circular-div {
  height: 150px;
  width: 150px;
  border-radius: 50%;
  background-color: palevioletred;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
}
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let squareDiv = document.getElementById('square-div');
let circularDiv = document.getElementById('circular-div');
squareDiv.appendChild(circularDiv);
</solution>
</codeblock>