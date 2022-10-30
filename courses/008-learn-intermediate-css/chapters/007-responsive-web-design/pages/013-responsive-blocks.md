One of the earliest methods
of creating responsive layouts
is to set the width of blocks
in percentages and stack them
one below the other for mobile
devices. With the help of media
queries, we can use `float`
to stack them next to each
other on larger screens:

<Editor lang="css">
<code>
<panel lang="html">
<header></header>
<div class="content">
  <div class="left">
  </div>
  <div class="right">
  </div>
</div>
</panel>
<panel lang="css">
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
.right {
  padding: 10px;
  margin-top: 10px;
}

header {
  height: 80px;
  background-color: #f1f5ff;
}

.left {
  height: 250px;
  background-color: #d4d7ff;
}

.right {
  height: 250px;
  background-color: #ffd4d7;
}

@media (min-width: 767px) {
  .left {
    width: 29%;
    float: left;
  }
  .right {
    width: 69%;
    float: right;
  }
</panel>
</code>
</Editor>

While this works, creating
huge layouts with the `float`
property alone gets complex.
We have better ways of creating
responsive layouts using
**flexbox** and **grid**
which we will explore in
the upcoming chapters.