The number and heights of the **rows** in a grid layout are specified by the
`grid-template-rows` property.

Each value in the values list, which is separated by spaces, indicates the
height of the corresponding row.

Lets look at some examples:

```css
.container {
  display: grid;
  grid-template-rows: 100px 80px 120px;
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
  <div>9</div>
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-rows: 100px 80px 120px;
  grid-template-columns: auto auto auto;
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

```css
.grid-container {
  display: grid;
  grid-template-rows: auto;
}
```

**auto:**

We can use `auto`, if we want the container's height to define the height of the
rows.

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
  grid-template-rows: auto;
  height: 300px;
  grid-template-columns: auto auto auto;
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
