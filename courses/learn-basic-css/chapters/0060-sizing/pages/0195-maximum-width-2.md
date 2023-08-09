If `max-width` is smaller than `width`,
the `max-width` value takes precedence and
restricts the width of the element, even if
the `width` property suggests a larger width
for the element.

![max width](https://ucarecdn.com/4040dc15-45bd-4d78-9095-2ca33764b4b2/)

In the above example, the first container **Div 1**
has a width of 50%, while the second container **Div 2**
has a width of 50% with a maximum width of 250px.
The `max-width` property ensures that the second
container won't expand beyond 250 pixels in width,
even if the content inside it is wider.

<codeblock language="css" type="lesson">
<code>
<panel language="html" hidden="true">
<div class=div-wrapper>
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
    Max Width: 250px
    </div>
  </div>
</div>
</panel>
<panel language="css">
/*CSS related to lesson*/

.first {
  width: 50%;
  background-color: #557ADA;
}
.second {
  width: 50%;
  max-width: 250px;
  background-color: #CD6149;
}

/*CSS for styling*/

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
  padding-left:20px;
}
.div-wrapper {
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

You can play around with this code by opening it in the **neetoCode** editor.
