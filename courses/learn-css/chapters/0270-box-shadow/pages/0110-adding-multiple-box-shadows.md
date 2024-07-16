We can apply multiple box shadows to an element
by adding a comma after the first set of
values and specifying new ones.

```css
box-shadow: [box shadow properties 1], [box shadow properties 2],... [box shadow properties n];
```

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="container">
  <div class="box diagonal-shadows"></div>
  <div class="box layered-shadows"></div>
  <div class="box multiple-shadows"></div>
  <div class="box layered-blur-shadows"></div>
</div>
</panel>
<panel language="css">
#container {
  display: flex;
  justify-content: space-around;
  flex-direction: row;
  flex-wrap: wrap;
  background-color: peachpuff;
}

.box {
  height: 220px;
  width: 220px;
  margin: 30px;
  font-size: 18px;
  background-color: coral;
}

.diagonal-shadows {
  box-shadow:
    10px 10px darkred,
    -10px -10px darkblue;
}

.layered-shadows {
  box-shadow: 
    15px 15px teal,
    30px 30px darkgreen;
}

.multiple-shadows {
  box-shadow:
    8px -8px 0px -4px rgb(255, 255, 255),
    8px -8px rgb(30, 192, 26),
    16px -16px 0px -4px rgb(255, 255, 255),
    16px -16px rgb(254, 155, 84),
    24px -24px 0px -4px rgb(255, 255, 255),
    24px -24px rgb(255, 216, 18);
}

.layered-blur-shadows {
  box-shadow: 
    0px 4px 16px rgba(0, 0, 0, 0.5),
    0px 8px 24px rgba(0, 0, 0, 0.5),
    0px 16px 56px rgba(0, 0, 0, 0.5);
}
</panel>
</code>
</codeblock>

In the above example, we have shown the application
of more than one box shadow to an element.
Applying multiple box shadows allows for creative
and intricate designs.
