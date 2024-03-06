Modify the `box-shadow` property to create an inner shadow effect within the element.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="container">
  <div class="box"></div>
</div>
</panel>
<panel language="css">
#container {
  display: flex;
  justify-content: space-around;
  background-color: peachpuff;
  height: 95vh;
}

.box {
  height: 220px;
  width: 220px;
  margin: 30px;
  background-color: coral;

  box-shadow:
    10px 10px 20px rgba(255, 0, 0, 0.5),
    -10px -10px 20px rgba(0, 0, 255, 0.5);
}
</panel>
</code>

<solution>
#container {
  display: flex;
  justify-content: space-around;
  background-color: peachpuff;
  height: 95vh;
}

.box {
  height: 220px;
  width: 220px;
  margin: 30px;
  background-color: coral;

  box-shadow:
    inset 10px 10px 20px rgba(255, 0, 0, 0.5),
    inset -10px -10px 20px rgba(0, 0, 255, 0.5);
}
</solution>
</codeblock>
