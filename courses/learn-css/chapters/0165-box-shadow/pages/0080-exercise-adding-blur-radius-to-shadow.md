Add a **blur-radius** of **10px** to the
`box-shadow` property of the elements with the
class **box**.

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
  width: 200px;
  height: 200px;
  margin: 30px;
  border-radius: 10px;
  background-color: coral;
  box-shadow: -30px 30px orange;
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
  width: 200px;
  height: 200px;
  margin: 30px;
  border-radius: 10px;
  background-color: coral;
  box-shadow: -30px 30px 10px orange;
}
</solution>
</codeblock>
