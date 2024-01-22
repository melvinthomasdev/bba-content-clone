**Auto Fit:**

In the previous lesson we saw how `grid-template-columns`, `repeat` and `minmax`
can be used to create large layouts with minimum code. Now let's see how to make
these large layouts responsive for small screen devices.

To achieve wrapping of multiple columns we can use `auto-fit`.

Let's look at an example
`grid-template-columns: repeat( auto-fit, minmax(50px, 1fr) )`

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>

<div class="container">
  <div class="html-name">H</div>
  <div class="html-name">T</div>
  <div class="html-name">M</div>
  <div class="html-name">L</div>
  <div id="name-separater">&</div>
  <div class="css-name">C</div>
  <div class="css-name">S</div>
  <div class="css-name">S</div>
</div>
</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: repeat( auto-fit, minmax(50px, 1fr) );
  grid-auto-rows: 50px;
  grid-gap: 5px;
}

/*Additional CSS for styling*/
.html-name {
  background-color: #29B6FE;
}

#name-separater {
  background-color: black;
  color: snow;
}

.css-name {
  background-color: #E511A4;
  color: #0a0505;
}

.css-name::after, .html-name::before {
  content: "_";
  position: absolute;
  top: -28px;
  color: snow;
  font-weight: 700;
  font-size: 64px;
}

.css-name::after {
  left: -20px;
}

.html-name::before {
  right: -20px;
  z-index: 1;
}

.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 32px;
  font-family: Arial;
  font-weight: 700;
  position: relative;
  box-shadow: -1px -1px 1px 1px #2d2d2d;
  border-radius: 5%;
}
</panel>
</code>
</codeblock>

So in the above example we observed that `auto-fit` tries to fit into the
currently available space by expanding the grid items, by using `minmax` we
ensured that the grid items don’t get too narrow.

<image>auto-fit-fill.png</image>

**Auto Fill:**

Similar to `auto-fit` the `auto-fill` creates implicit columns whenever a new
column can fit, but instead of expanding the grid items, it adds empty
space which could be seen by inspecting the DOM elements of the grid container.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden=true>
<div class="container">
  <div class="html-name">H</div>
  <div class="html-name">T</div>
  <div class="html-name">M</div>
  <div class="html-name">L</div>
  <div id="name-separater">&</div>
  <div class="css-name">C</div>
  <div class="css-name">S</div>
  <div class="css-name">S</div>
</div>

</panel>
<panel language="css">
/*CSS related to the topic*/
.container {
  display: grid;
  grid-template-columns: repeat( auto-fill, minmax(50px, 1fr) );
  grid-auto-rows: 50px;
  grid-gap: 5px;
}

/*Additional CSS for styling*/
.html-name {
  background-color: #29B6FE;
}

#name-separater {
  background-color: black;
  color: snow;
}

.css-name {
  background-color: #E511A4;
  color: #0a0505;
}

.css-name::after, .html-name::before {
  content: "_";
  position: absolute;
  top: -28px;
  color: snow;
  font-weight: 700;
  font-size: 64px;
}

.css-name::after {
  left: -20px;
}

.html-name::before {
  right: -20px;
  z-index: 1;
}

.container > div {
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 32px;
  font-family: Arial;
  font-weight: 700;
  position: relative;
  box-shadow: -1px -1px 1px 1px #2d2d2d;
  border-radius: 5%;
}
</panel>
</code>
</codeblock>

Try resizing your browser window, to see it in action.
