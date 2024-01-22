Use the `calc()` function to make the
div's `height` half of the viewport's `height`
and
the div's `width` be half of the viewport's
`width`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
body{
  background-color: #f1f1f1;
}
div {
  background-color: limegreen;
  /*Write your code here*/
}
</panel>
</code>

<solution>
body{
  background-color: #f1f1f1;
}
div {
  background-color: limegreen;
  /*Write your code here*/
  height: calc(100vh/2);
  width: calc(100vw/2);
}
</solution>
</codeblock>
