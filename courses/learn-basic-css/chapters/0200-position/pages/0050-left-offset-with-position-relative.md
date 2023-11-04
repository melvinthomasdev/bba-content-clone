When we set the offset `left` property
of an element with position property
set as `relative`,
the element actually moves away from
the left edge of the screen.

That is because the element is pushed
away from the left towards right:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div class="static">
    <p>Home</p>
    <p>About</p>
    <p>Contact</p>
  </div>
  <div class="relative">
    <h1>Welcome to my website!</h1>
    <p>Let us learn about the left offset property.</p>
  </div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  flex-direction: column;
}
.relative {
  height: 100vh;
  text-align: center;
  position: relative;
  left: 20px;
  color: red;
  background-color: yellow;
}
.static {
  background-color: gray;
  color: #fff;
  display: flex;
  justify-content: space-around;
}
</panel>
</code>
</codeblock>

From the example above,
we can see that the relative
element has moved away from
the left edge,
while the static element
occupies the entire viewing
width.

This is because we have added
**position** property as `relative`
with **left** offset as **20px**
to the element with class `relative`.
