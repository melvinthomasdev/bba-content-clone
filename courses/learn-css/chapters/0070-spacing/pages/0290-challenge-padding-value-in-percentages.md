Set the **padding** of the **child** div element
to be **5%** of the parent div's **width**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="parent">
  <div class="child"></div>
</div>
</panel>
<panel language="css">
.parent {
  width: 100px;
  height: 150px;
  background: rgba(255, 0, 0, 0.5);
  border: 5px solid black;
}

.child {
  width: 150px;
  height: 200px;
  background: rgba(0, 255, 0, 0.5);
  border: 5px solid black;
}
</panel>
</code>

<solution>
.parent {
  width: 100px;
  height: 150px;
  background: rgba(255, 0, 0, 0.5);
  border: 5px solid black;
}

.child {
  padding: 5%;
  width: 150px;
  height: 200px;
  background: rgba(0, 255, 0, 0.5);
  border: 5px solid black;
}
</solution>
</codeblock>
