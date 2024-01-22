Add a bouncy effect to the transition by using the
`cubic-bezier` function with the
parameters `0.7, -0.6, 0.3, 1.6`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="box">Hover Me</div>
</panel>
<panel language="css">
body {
  display: flex;
  align-items: center;
  justify-content: center;
}

.box {
  width: 150px;
  height: 50px;
  background-color: #3498db;
  color: white;
  text-align: center;
  line-height: 50px;
  margin-top: 40px;
  cursor: pointer;
  border-radius: 5px;
  transition-property: all;
  transition-duration: 1s;
  /*Write your code here*/
}

.box:hover {
  transform: scale(1.5);
  background-color: #e74c3c;
}
</panel>
</code>

<solution>
body {
  display: flex;
  align-items: center;
  justify-content: center;
}

.box {
  width: 150px;
  height: 50px;
  background-color: #3498db;
  color: white;
  text-align: center;
  line-height: 50px;
  margin-top: 40px;
  cursor: pointer;
  border-radius: 5px;
  transition-property: all;
  transition-duration: 1s;
  /*Write your code here*/
  transition-timing-function: cubic-bezier(0.7, -0.6, 0.3, 1.6);
}

.box:hover {
  transform: scale(1.5);
  background-color: #e74c3c;
}
</solution>
</codeblock>
