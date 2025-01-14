Instead of setting the width
in pixels, if we use percentages,
all the elements auto adjust
their width based on the screen size:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<header>
  Header
</header>
<div class="content">
  <div class="left">
    Left Sidebar
  </div>
  <div class="main">
    Main Content
  </div>
  <div class="right">
    Right Sidebar
  </div>
</div>
</panel>
<panel language="css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  padding: 10px;
}
header, .left, .main, .right {
  padding: 10px;
  background-color: #f1f5ff;
}
header {
  height: 80px;
}
.left, .right {
  width: 25%; /* Width in percentage */
  float: left;
  margin-top: 10px;
  height: 250px;
}
.main {
  width: 46%; /* Width in percentage */
  float: left;
  margin: 10px 2% 0;
  height: 250px;
}
</panel>
</code>
</codeblock>

This is a **fluid layout**
because all the elements
adjust according to the
size of the screen just like
a liquid put inside a container.

But as we saw before,
the problem with this layout too,
is that the columns get very
narrow on small screen sizes. The
text doesn't look good in this scenario.