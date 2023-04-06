Let's try to understand what is a **grid item** by looking at the below code.

**HTML:**

```html
<div class="container">
  <div class="item1">1</div>
  <div class="item2">2</div>
  <div class="item3">3</div>
</div>
```

**CSS:**

```css
.container {
  display: grid;
}
```

In the above code we could see the **div** with the **container** class is
parent to the **div** with the class of `item1`, `item2` and `item3`. Now when
we apply `display: grid` property to the parent **div**, then it becomes the
**grid container** and the child items are called **grid item**.

So, basically a **grid item** is the child or direct descendants of a grid
container.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="item1">1</div>
  <div class="item2">2</div>
  <div class="item3">3</div>
  <div class="item4">4</div>
  <div class="item5">5</div>
  <div class="item6">6</div>
  <div class="item7">7</div>
  <div class="item8">8</div>
  <div class="item9">9</div>
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
.item1 {
  grid-column: 1 / 3;
}
.item5 {
  grid-column: 2 / 4;
}
.item8 {
  grid-column: 1 / 4;
}
.item9 {
  grid-column: 1 / -1;
}
/*Additional CSS for styling*/
.container > div:nth-child(1n) {
  background-color: #92d2b4;
}
.container > div:nth-child(2n) {
  background-color: #f26561;
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

**Grid items** can also be controlled by applying css grid properties to them
individually. In the above example we applied the below css to the individual
items.

```css
.item1 {
  grid-column: 1 / 3;
}
.item5 {
  grid-column: 2 / 4;
}
.item8 {
  grid-column: 1 / 4;
}
.item9 {
  grid-column: 1 / -1;
}
```
