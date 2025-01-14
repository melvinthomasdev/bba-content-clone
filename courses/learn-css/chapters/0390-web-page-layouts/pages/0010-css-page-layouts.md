So far we have seen how to style text,
links, images, individual blocks. We
have tried to position them at different
locations in our web pages. We have learnt
many ways to style parts of our web pages.
Now, we will now see how to put them all
together to design full web pages.

Given below is an example of a
most common web page structure:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<header>
  Header
</header>
<nav>
  Navigation bar
</nav>
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
<footer>
  Footer
</footer>
</panel>
<panel language="css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  padding: 10px;
  font-family: sans-serif;
  font-size: 1em;
  text-align: center;
}
header, nav, .left, .main, .right, footer {
  padding: 10px;
  background-color: #f1f5ff;
}
header {
  height: 80px;
  line-height: 60px;
}
nav, footer {
  margin-top: 10px;
  height: 50px;
  line-height: 30px;
}
.left, .right {
  width: 25%;
  float: left;
  margin-top: 10px;
  height: 250px;
  line-height: 230px;
}
.main {
  width: 46%;
  float: left;
  margin: 10px 2% 0;
  height: 250px;
  line-height: 230px;
}
.content::after {
  content: "";
  display: block;
  clear: both;
}
</panel>
</code>
</codeblock>

The header, navigation bar
and
footer occupy 100% width of the page.
The sidebars
and
main content are placed next to each other
using the `float` property. Individual blocks
are styled using `width`, `height`, `margin`,
`padding` and `background-color`. The
`line-height` property is used to
vertically center the text in each block.

Go to full screen mode in the above
editor
and
resize the output panel. This is
similar to viewing the web page on
different devices and screen sizes.
Notice how the blocks shrink
and
expand automatically adjusting to
the window width. This makes the sidebars
and
main content become too small
to display text on small screens.