The margin and padding of an element in **percentage** value
are calculated relative to the **width** of its parent element.

Let's look at an example for `margin` property:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="parent-container">
  <div class="child-element"></div>
</div>
</panel>
<panel language="css">
.parent-container {
  width: 150px;
  height: 200px;
  border: 5px solid red;
}

.child-element {
  width: 150px;
  height: 200px;
  border: 5px dashed blue;

  /* Add a margin in percentage */
  margin: 10%;

}
</panel>
</code>
</codeblock>

The margin value for the **child-element** is calculated as
**10%** of the width of the **parent-container**.
**10%** of **150px** is **15px**.
So, `margin: 10%` will mean here, `margin: 15px`.

The same reasoning applies to the the `padding` property:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="parent-container">
  <div class="child-element"></div>
</div>
</panel>
<panel language="css">
.parent-container {
  width: 150px;
  height: 200px;
  border: 5px solid red;
}

.child-element {
  width: 150px;
  height: 200px;
  border: 5px dashed blue;

  /* Add a padding in percentage */
  padding: 10%;

}
</panel>
</code>
</codeblock>

The padding value for **child-element** remains as **10%**
of the width of the **parent-container**.
**10%** of **150px** is **15px**.
So, `padding: 10%` will mean here, `padding: 15px`.
