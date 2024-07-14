Turn this rectangular div into
a semi-circle by specifying
a `border-radius` of `150px`
for the top-left and top-right corners
and `0` for the bottom-left and bottom-right corners:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  </div>
</panel>
<panel language="css">
div {
  width: 200px;
  height: 100px;
  background-color: tomato;
}
</panel>
</code>

<solution>
div {
  width: 200px;
  height: 100px;
  background-color: tomato;
  border-radius: 150px 150px 0 0;
}
</solution>
</codeblock>