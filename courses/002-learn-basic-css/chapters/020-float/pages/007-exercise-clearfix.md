Add the necessary properties
to `clearfix::after`
to clear the floating
elements of `nav`:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<nav class="clearfix">
  <a href="#" id="prev">
    &lt;&lt; Prev
  </a>
  <a href="#" id="next">
    Next &gt;&gt;
  </a>
</nav>
</panel>
<panel lang="css">
#prev {
  float: left;
}
#next {
  float: right;
}
nav {
  background-color: lightblue;
  padding: 10px;
}
</panel>
</code>

<solution>
#prev {
  float: left;
}
#next {
  float: right;
}
nav {
  background-color: lightblue;
  padding: 10px;
}
.clearfix::after {
  content: "";
  clear: both;
  display: block;
}
</solution>
</Editor>