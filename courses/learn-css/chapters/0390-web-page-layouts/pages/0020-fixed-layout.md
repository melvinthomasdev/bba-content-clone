Let's see how the problem
of different screen sizes
is solved using various
types of layouts.

One way is to fix the width of
the entire page and width of
other elements in pixels:

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
  width: 900px; /* Fixed width */
  margin: auto;
  padding: 10px;
  font-family: sans-serif;
  font-size: 1em;
  text-align: center;
}
header, .left, .main, .right {
  padding: 10px;
  background-color: #f1f5ff;
}
header {
  height: 80px;
  line-height: 60px;
}
.left,
.right {
  width: 215px; /* Fixed width */
  float: left;
  margin-top: 10px;
  height: 250px;
  line-height: 230px;
}
.main {
  width: 430px; /* Fixed width */
  float: left;
  margin: 10px 10px 0;
  height: 250px;
  line-height: 230px;
}
</panel>
</code>
</codeblock>

Resize the output panel in full screen mode and notice that the width of all elements is fixed. The width of `body` is set to **900px** and `margin` is set to `auto`, which restricts the content to **900px** and centers the content horizontally. Hence, this is called a **fixed layout**.

This design looks good on desktop screen sizes but on tablets and mobile phones, a horizontal scrollbar appears, which doesn't give a good experience.

This was standard layout a few years ago,
before smartphones were introduced.
But it's no more used for
designing modern websites.