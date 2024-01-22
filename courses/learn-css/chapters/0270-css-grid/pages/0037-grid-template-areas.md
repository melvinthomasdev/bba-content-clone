The `grid-template-areas` attribute can be used to specify a grid layout's areas
by using the `grid-area` property.

The `grid-area` property gives each grid item a name, which can referenced in
the `grid-template-areas` property.

Apostrophes indicate each area's boundaries. And we can keep empty space by
using the period symbol.

Let's look at an example:

```css
.container {
  display: grid;
  grid-template-areas:
    ". h h h h h h h h h h h"
    "m c c c c c c c c c c c"
    ". f f f f f f f f f f f";
}
.header {
  grid-area: h;
}
.menu {
  grid-area: m;
}
.content {
  grid-area: c;
}
.footer {
  grid-area: f;
}
```

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="header">HEADER</div>
  <div class="menu">MENU</div>
  <div class="content">CONTENT</div>
  <div class="footer">FOOTER</div>
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-gap: 5px;
  grid-template-columns: repeat(12, 1fr);
  grid-template-rows: 60px 240px 60px;
  grid-template-areas:
    ". h h h h h h h h h h h"
    "m c c c c c c c c c c c"
    ". f f f f f f f f f f f";
}
.header {
  grid-area: h;
  display: flex;
  justify-content: center;
  align-items: center;
}
.menu {
  grid-area: m;
}
.content {
  grid-area: c;
}
.footer {
  grid-area: f;
}
/*Additional CSS for styling*/
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #fae8a1;
}
body {
  background-color: #f6e59e;
  padding: 10px;
  margin: 0px;
}
.container > div:nth-child(1n) {
  background-color: #92d2b4;
}
.container > div:nth-child(3n) {
  background-color: #7ecfa7;
}
.container > div:nth-child(2n) {
  background-color: #f26561;
}
.container > div:nth-child(4n) {
  background-color: #f7c558;
}
</panel>
</code>
</codeblock>
