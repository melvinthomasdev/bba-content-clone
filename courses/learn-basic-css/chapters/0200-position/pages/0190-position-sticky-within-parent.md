The `sticky` element stops being sticky
once the page is scrolled such that the
element reaches the bottom of its parent
element. Try scrolling inside the example
given below to see the difference:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="parent">
  <div id="sticky"></div>
</div>
</panel>
<panel language="css">
body {
  margin: 0;
  min-height: 200vh;
}

#parent {
  width: 250px;
  height: 250px;
  background-color: teal;
  margin-top: 50px;
}

#sticky {
  background-color: orange;
  width: 100px;
  height: 100px;
  position: sticky;
  top: 0px;
}
</panel>
</code>
</codeblock>