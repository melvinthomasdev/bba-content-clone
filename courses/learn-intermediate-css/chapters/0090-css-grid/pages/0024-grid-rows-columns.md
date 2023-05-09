The `grid-row` and `grid-column` property sets the **position** and the **size** of a grid item.

`grid-row` and `grid-column` are shorthand for the following properties:

```css
grid-row: grid-row-start / grid-row-end;
```

```css
grid-column: grid-column-start / grid-column-end;
```

`grid-row-start` and `grid-column-start` specify the row/column grid line of the grid layout from where the grid item **starts**.

And `grid-row-end` and `grid-column-end` specify the row/column grid line where the grid item **ends**.

**Let's look at some examples:**

```css
.item1 {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
}
```

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="item1">1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
</div>
</panel>
<panel language="css">
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-auto-rows: 100px;
}
.item1 {
  grid-column: 1 / 3;
  grid-row: 1 / 3;
  background-color: #f26561;
}
.container > div:nth-child(1) {
  background-color: #5bc292;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #00000;
  border: 1px solid red;
}
</panel>
</code>
</codeblock>

Let's look at another example, where we use **span** and **-1**:

```css
.item1 {
  grid-column: 1 / -1;
  grid-row: 1 / span 2;
}
```

Here **-1** indicates the last grid line of the grid layout and **span 2** means the item stretches or extends 2 rows.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="item1">1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
</div>
</panel>
<panel language="css">
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-auto-rows: 100px;
}
.item1 {
  grid-column: 1 / -1;
  grid-row: 1 / span 2;
  background-color: #f26561;
}
.container > div:nth-child(1) {
  background-color: #5bc292;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #00000;
  border: 1px solid red;
}
</panel>
</code>
</codeblock>


`grid-row-end` and `grid-column-end` values are **optional**, if we want to change the position only and not the size of the grid item.

```css
.item1 {
  grid-column: 2;
  grid-row: 2;
}
```

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="item1">1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
</div>
</panel>
<panel language="css" hidden=true>
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  grid-auto-rows: 100px;
}
.item1 {
  grid-column: 2;
  grid-row: 2;
  background-color: #f26561;
}
.container > div:nth-child(1) {
  background-color: #5bc292;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #00000;
  border: 1px solid red;
}
</panel>
</code>
</codeblock>
