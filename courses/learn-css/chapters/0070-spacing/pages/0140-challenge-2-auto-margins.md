Apply `auto` margins to the `.centered-box` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="centered-box">Centered Box</div>
</div>
</panel>
<panel language="css">
.container {
  width: 400px;
  height: 200px;
  background-color: #f1c40f;
  border: 1px solid #e67e22;
  padding: 20px;
  text-align: center;
}

.centered-box {
  width: 150px;
  height: 150px;
  background-color: #3498db;
}
</panel>
</code>

<solution>
.container {
  width: 400px;
  height: 200px;
  background-color: #f1c40f;
  border: 1px solid #e67e22;
  padding: 20px;
  text-align: center;
}

.centered-box {
  width: 150px;
  height: 150px;
  background-color: #3498db;
  margin: auto;
}
</solution>
</codeblock>
