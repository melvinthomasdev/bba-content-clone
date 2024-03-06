Use the `min()` function to set the width to the lesser
value between **40%** of the viewport width and **400px**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="box"></div>
</panel>
<panel language="css">
.box {
  width: 400px;
  height: 100px;
  background: #CD6149;
  border-radius: 5px;
  border: 2px solid black;
}
</panel>
</code>

<solution>
.box {
  width: min(40%,400px);
  height: 100px;
  background: #CD6149;
  border-radius: 5px;
  border: 2px solid black;
}
</solution>
</codeblock>
