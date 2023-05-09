**Auto Fit:**

In the previous lesson we saw how `grid-template-columns`, `repeat` and `minmax`
can be used to create large layouts with minimum code. Now let's see how to make
these large layouts responsive for small screen devices.

To achieve wrapping of multiple columns we can use `auto-fit`.

Let's look at an example
`grid-template-columns: repeat( auto-fit, minmax(150px, 1fr) )`

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
  grid-template-columns: repeat( auto-fit, minmax(150px, 1fr) );
  grid-auto-rows: 150px;
  grid-gap: 5px;
}
/*Additional CSS for styling*/
.container > div:nth-child(1n) {
  background-color: #92d2b4;
}
.container > div:nth-child(3n) {
  background-color: #7ecfa7;
}
.container > div:nth-child(2n) {
  background-color: #f26561;
}
.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 24px;
  color: #000000;
}
</panel>
</code>
</codeblock>

So in the above example we observed that `auto-fit` tries to fit into the
currently available space by expanding the grid items, by using `minmax` we
ensured that the grid items don’t get too narrow.

<image>auto-fit.png</image>

**Auto Fill:**

Similar to `auto-fit` the `auto-fill` creates implicit columns whenever a new
column can fit, but instead of expanding the grid items, it adds empty
space which could be seen by inspecting the DOM elements of the grid container.

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
  grid-template-columns: repeat( auto-fill, minmax(150px, 1fr) );
  grid-auto-rows: 150px;
  grid-gap: 5px;
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
  color: #000000;
}
</panel>
</code>
</codeblock>

Try resizing your browser window, to see it in action.
