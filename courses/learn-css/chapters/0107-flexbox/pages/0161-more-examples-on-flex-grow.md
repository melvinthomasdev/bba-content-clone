In this lesson, we look at multiple examples to understand the behavior of `flex-grow` property in various scenarios.

**Example 1: Equal Distribution**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <p class="p1">Paragraph 1</p>
  <p class="p2">Paragraph 2</p>
  <p class="p3">Paragraph 3</p>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
}

p {
  background-color: #f1f1f8;
  padding: 10px;
  border: 1px solid #a1a1a1;
  margin: 5px;
}

.p1, .p2, .p3 {
  flex-grow: 1;
}
</panel>
</code>
</codeblock>

In the above example, each of the flex items `p1`, `p2`, and `p3` has a `flex-grow` value of 1, which means they will equally share any extra space.

**Example 2: Unequal Distribution**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <p class="p1">First Paragraph</p>
  <p class="p2">Second Paragraph</p>
  <p class="p3">Third Paragraph</p>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
}

p {
  background-color: #f1f1f8;
  padding: 10px;
  border: 1px solid #a1a1a1;
  margin: 5px;
}

.p1 {
  flex-grow: 2;
}

.p2, .p3 {
  flex-grow: 1;
}
</panel>
</code>
</codeblock>

In the above example, the flex item `p1`, which has a `flex-grow` value of 2, will take up twice as much extra space compared to `p2` and `p3`. The items, `p2` and `p3`, each with a `flex-grow` value of 1, will share the remaining extra space equally.

**Example 3: No Growth**

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <p class="p1">This paragraph will not grow</p>
  <p class="p2">This paragraph will grow</p>
  <p class="p3">This paragraph will also grow</p>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
}

p {
  background-color: #f1f1f8;
  padding: 10px;
  border: 1px solid #a1a1a1;
  margin: 5px;
}

.p1 {
  flex-grow: 0; /* No growth */
}

.p2, .p3 {
  flex-grow: 1; /* Equal growth */
}
</panel>
</code>
</codeblock>

In the above example, the flex item `.p1`, which has a `flex-grow` value of 0, will not grow and will remain fixed in size based on its content. On the other hand, the flex items `.p2` and `.p3`, each with a `flex-grow` value of 1, will share any available extra space equally.


The flex-grow property is a tool in CSS Flexbox for controlling how flex items expand to fill available space within a flex container.