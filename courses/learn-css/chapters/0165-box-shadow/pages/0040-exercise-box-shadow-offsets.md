Using the `box-shadow` property,
add a shadow effect to the element
with the class **box**.
Use values of **20px** for **offset-x**
and **30px** for **offset-y**.

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
  /*Write your code here*/
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
  /*Write your code here*/
  box-shadow: 20px 30px;
}
</solution>
</codeblock>
