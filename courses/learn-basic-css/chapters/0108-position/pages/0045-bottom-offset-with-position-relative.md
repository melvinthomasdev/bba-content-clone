When we use the offset `bottom` property
on an element with a `relative` position,
it does the opposite of the top property.

This means it moves the element up
and
away from the bottom edge of the screen.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div class="content">
    <h1>Welcome to My Website!</h1>
    <p>Today we will be learning about bottom offset!</p>
  </div>
  <div class="button-section">
    <button class="static-button">Previous Page</button>
    <button class="relative-button">Next Page</button>
  </div>
</div>
</panel>
<panel language="css">
.container {
  height: 100vh;
  
}
.content {
  text-align: center;
  margin-bottom: 100px;
}
.button-section {
  display: flex;
  justify-content: space-around;

}
.relative-button {
  position: relative;
  bottom: 20px;
}
button {
  padding: 5px;
  border-radius: 5px;
  background-color: blue;
  color: white;
}
button:hover {
  box-shadow: 2px 2px lightblue;
}
</panel>
</code>
</codeblock>

From the example above,
we can see that the `button`
element for **Next Page**
has moved up from the bottom
edge by **20px**.

This is because we have added
position property as `relative`
with **bottom** offset of **20px**
to the button element with class
`relative-button`.
