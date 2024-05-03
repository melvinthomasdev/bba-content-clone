The number and widths of **columns** in a grid layout are specified by the
`grid-template-columns` property.

Each value in the values list, which is separated by spaces, indicates the
**size** of the corresponding column.

For example, the below code will generate **4** columns of **100px** each.

```css
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px 100px;
}
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
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px 100px;
  grid-template-rows: auto;
  grid-gap: 3px;
}
/*Additional CSS for styling*/
.container > div:nth-child(1n) {
  background-color: #5bc292;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #00000;
}
</panel>
</code>
</codeblock>

**auto:**

We can use `auto`, if we want the container's size to define the size of the
columns.

```css
.grid-container {
  display: grid;
  grid-template-columns: auto auto auto auto;
}
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
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: auto auto auto auto;
  grid-template-rows: auto;
  grid-gap: 3px;
}
/*Additional CSS for styling*/
.container > div:nth-child(1n) {
  background-color: #5bc292;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #00000;
}
</panel>
</code>
</codeblock>
