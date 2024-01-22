Apply a height of `60px` to the `.box` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="column left-column">
    <div class="box">Left Box 1</div>
    <div class="box">Left Box 2</div>
  </div>
  <div class="column right-column">
    <div class="box">Right Box 1</div>
    <div class="box">Right Box 2</div>
  </div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.column {
  width: 50%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.left-column {
  background-color: #3498db;
}
.right-column {
  background-color: #2ecc71;
}
.box {
  width: 80%;
  margin: 10px;
  background-color: white;
}
</panel>
</code>

<solution>
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.column {
  width: 50%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.left-column {
  background-color: #3498db;
}
.right-column {
  background-color: #2ecc71;
}
.box {
  width: 80%;
  height: 60px;
  margin: 10px;
  background-color: white;
}
</solution>
</codeblock>
