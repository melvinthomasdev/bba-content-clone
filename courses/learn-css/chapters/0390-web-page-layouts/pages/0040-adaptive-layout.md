If we can change the
appearance of elements
based on screen size, our problem is
solved. We can use **media queries**
to set different styles
for different sizes.

Let's look at an example first:

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
  margin: auto;
  width: 1200px;
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
  width: 348px;
  float: left;
  height: 250px;
  background-color: #d4d7ff;
}
.main {
  width: 828px;
  float: right;
  height: 250px;
  background-color: #ffd4d7;
}
@media (min-width: 768px) and (max-width: 1200px) {
  body {
    width: 768px;
  }
  .left {
    width: 222px;
  }
  .main {
    width: 530px;
  }
}
@media (min-width: 480px) and (max-width: 767px) {
  body {
    width: 480px;
  }
  .left,
  .main {
    float: none;
    width: 480px;
  }
}
@media (max-width: 479px) {
  body, .left, .main {
    width: 300px;
  }
}
</panel>
</code>
</codeblock>

Resize the output panel in full screen mode and notice that there are 4 fixed layouts based on different screen sizes. Width of the `body`, `.left` and `.main` are specified in pixels and changed based on screen width.

These are media queries:

```
@media (min-width: 768px) and (max-width: 1200px) { ... }
```

The styles specified within this block are applied when the screen width is a *minimum* of **768px** and a *maximum* of **1200px**.

Such a layout is called an **adaptive** layout.