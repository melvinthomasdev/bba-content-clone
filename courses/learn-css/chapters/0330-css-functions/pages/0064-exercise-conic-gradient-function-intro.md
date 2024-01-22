Add a conic gradient with colours `gold`, `darkorange`, `crimson`, `rebeccapurple`, and `slateblue` to the background of the `.conic` class.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="conic"></div>
</panel>
<panel language="css">
body {
  display: flex;
  justify-content: space-around;
}

.conic {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  border: 1px solid black;
}
</panel>
<solution>
body {
  display: flex;
  justify-content: space-around;
}

.conic {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  border: 1px solid black;
  background: conic-gradient(
    gold,
    darkorange,
    crimson,
    rebeccapurple,
    slateblue
  );
}
</solution>
</code>
</codeblock>
