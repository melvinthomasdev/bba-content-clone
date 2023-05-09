`grid-template` is a shorthand property to set  `grid-template-rows`, `grid-template-columns` and `grid-template-areas` in a single declaration.

Let's look at an example with below format:

```css
grid-template: grid-template-rows / grid-template-columns;
```

**Example:**

```css
grid-template: 100px 100px 100px / 100px auto 200px;
```

is equivalent to

```css
grid-template-rows: 100px 100px 100px;
grid-template-columns: 100px auto 200px;
grid-template-areas: none;
```

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
  <div>7</div>
  <div>8</div>
  <div>9</div>
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-gap: 5px;
  grid-template: 100px 100px 100px / 100px auto 200px;
}
/*Additional CSS for styling*/
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #000000;
}
body {
  background-color: #f6e59e;
  padding: 10px;
  margin: 0px;
}
.container > div:nth-child(1n) {
  background-color: #92d2b4;
}
.container > div:nth-child(2n) {
  background-color: #f26561;
}
</panel>
</code>
</codeblock>


Let's look at an example using this format:

```css
grid-template: "gird area" grid-template-rows / grid-template-columns;
```

**Example:**

```css
grid-template:
  "header header header" 100px
  "menu content content" 200px
  "footer footer footer" 50px /
  150px auto auto;
```
is equivalent to

```css
grid-template-areas:
  "header header header"
  "menu content content"
  "footer footer footer";
grid-template-rows: 100px 200px 50px;
grid-template-columns: 150px auto auto;
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
  grid-template:
  "header header header" 100px
  "menu content content" 200px
  "footer footer footer" 50px /
  150px auto auto;
}
.menu {
  grid-area: menu;
}
.content {
  grid-area: content;
}
.footer {
  grid-area: footer;
}
.header {
  grid-area: header;
  display: flex;
  justify-content: center;
  align-items: center;
}
/*Additional CSS for styling*/
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #000000;
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
