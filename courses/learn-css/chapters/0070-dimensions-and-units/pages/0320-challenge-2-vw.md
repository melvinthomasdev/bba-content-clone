Set the width of the `.box` to 50% of the window width using the `vw` unit.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="box">Flexible Width</div>
</div>
</panel>
<panel language="css">
.container {
  padding: 20px;
  background-color: #f0f0f0;
}
.box {
  padding: 10px;
  background-color: #ff6600;
  color: white;
  text-align: center;
}
</panel>
</code>

<solution>
.container {
  padding: 20px;
  background-color: #f0f0f0;
}
.box {
  width: 50vw;
  padding: 10px;
  background-color: #ff6600;
  color: white;
  text-align: center;
}
</solution>
</codeblock>
