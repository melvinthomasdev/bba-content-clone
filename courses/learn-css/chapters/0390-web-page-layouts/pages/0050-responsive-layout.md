Adaptive layouts are great, but with them,
you need to design multiple fixed layouts
and
take care of each element's width.
Also, you might have noticed a lot
of empty space on both sides of the
content for some screen sizes.

To solve these two problems,
we can use a mix of `fluid`
and
`adaptive` layouts. That is,
we can specify the widths in
percentages and use media
queries to change them as needed:

Take a look at this example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<header></header>
<div class="content">
  <div class="left">
  </div>
  <div class="main">
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
  margin: auto;
}

header,
.left,
.main {
  padding: 10px;
  margin-top: 10px;
}

header {
  height: 80px;
  background-color: #f1f5ff;
}

.left {
  width: 29%;
  float: left;
  height: 250px;
  background-color: #d4d7ff;
}

.main {
  width: 69%;
  float: right;
  height: 250px;
  background-color: #ffd4d7;
}

@media (max-width: 767px) {
  .left,
  .main {
    float: none;
    width: 100%;
  }
}
</panel>
</code>
</codeblock>

This layout is fluid and below the screen width of **767px**, the columns are stacked one below the other instead of next to each other.

Such layouts are called
**responsive layouts**.
Most modern websites are
either responsive or adaptive.