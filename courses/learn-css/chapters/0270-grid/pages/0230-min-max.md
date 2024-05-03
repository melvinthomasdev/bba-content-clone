The `minmax()` CSS function is used to set a minimum and maximum length of a
grid. It accepts 2 arguments _minimum value_ and _maximum value_. It is very
useful for creating responsive layouts when combined with relative units like
**fr**.

Let's look at some examples:

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
  grid-template-columns: minmax(100px, 1fr) 1fr 1fr;
  grid-auto-rows: 100px;
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

**minmax(100px, 1fr)** the width of the first column remains minimum `100px` or
at max `1fr`, so it changes according to the width of the screen.

Try resizing your browser window, to see it in action.
