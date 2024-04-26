Right now, the box-shadow for both 
the boxes is black in colour.

Add color **#AA7788** to the box-shadow property
of elements with class **rose-brown-shadow**.

Add color **#98FB98** to the box-shadow property
of elements with class **pale-green-shadow**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="container">
  <div class="box rose-brown-shadow"></div>
  <div class="box pale-green-shadow"></div>
</div>
</panel>
<panel language="css">
#container {
  height: 95vh;
  display: flex;
  justify-content: space-around;
  background-color: peachpuff;
}

.box {
  width: 200px;
  height: 200px;
  margin: 30px;
  border-radius: 10px;
  background-color: coral;
}

/*Write your code here*/

.rose-brown-shadow {
  box-shadow: 20px 30px;
}

.pale-green-shadow {
  box-shadow: 50px 30px;
}
</panel>
</code>

<solution>
#container {
  height: 95vh;
  display: flex;
  justify-content: space-around;
  background-color: peachpuff;
}

.box {
  width: 200px;
  height: 200px;
  margin: 30px;
  border-radius: 10px;
  background-color: coral;
}

/*Write your code here*/

.rose-brown-shadow {
  box-shadow: 20px 30px #AA7788;
}

.pale-green-shadow {
  box-shadow: 50px 30px #98FB98;
}
</solution>
</codeblock>
