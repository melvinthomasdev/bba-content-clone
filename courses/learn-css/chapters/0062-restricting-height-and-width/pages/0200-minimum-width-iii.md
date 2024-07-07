If `min-width` is larger than `width`,
the `min-width` value takes precedence and
enforces a minimum width for the element, even if
the `width` property suggests a smaller width
for the element.

![Min width](https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/minwidth-gif_ubjQ4zVm2.gif)

In the above example, the first container **Div 1**
has a width of 50%, while the second container **Div 2**
has a width of 50% with a minimum width of 250px.
The `min-width` property ensures that the second
container won't shrink beyond 250px in width,
even if the content inside it is smaller.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden="true">
<div class="main-container">
  <div class="first container">
    <div class="white-text">Div 1</div>
    <div>Width: 50%</div>
  </div>
  <br>
  <div class="second container">
    <div class="white-text">Div 2</div>
    <div>
      Width: 50%
      <br>
      Min Width: 250px
    </div>
  </div>
</div>
</panel>
<panel language="css">
/* CSS related to lesson */

.first {
  width: 50%;
  background-color: #557ADA;
}
.second {
  width: 50%;
  min-width: 250px;
  background-color: #CD6149;
}

/* CSS for styling */

.container {
  height: 100px;
  font-size: 20px;
  color: #EDE549;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 3px;
}
.container div {
  padding-left: 20px;
}
.main-container {
  background-color: #E5E8E7;
  padding: 40px 10px;
  border-radius: 5px;
  font-family: 'Open Sans', sans-serif;
}
.white-text {
  color: white;
}
</panel>
</code>
</codeblock>

You can play around with this code by opening it in the **NeetoCode** editor.
