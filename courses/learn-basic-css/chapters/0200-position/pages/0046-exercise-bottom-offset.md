Set `position:relative` for the element
with class `footer`
and
make it move away from the bottom by `30px`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
<div class="container">
  <div class="header">
    <h1>Test - Bottom Offset</h1>
  </div>
  <div class="content">
    <p>Make the footer move up by 30px</p>
  </div>
  <div class="footer">
    <span>©2023 BigBinary Academy</span>
  </div>
</div>
</panel>
<panel language="css">
* {
  text-align: center;
}
.header {
  color: orange;
}
.content {
  color: red;
  margin: 50px;
}
.footer {
  color: blue;
}
</panel>
</code>
<solution>
* {
  text-align: center;
}
.header {
  color: orange;
}
.content {
  color: red;
  margin: 50px;
}
.footer {
  color: blue;
  position: relative;
  bottom: 30px;
}
</solution>
</codeblock>