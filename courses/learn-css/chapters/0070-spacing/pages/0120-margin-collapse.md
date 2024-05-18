Consider the following situation.

<codeblock language="css" type="lesson">
<panel language="html">
<div class="parent">
  <p>Welcome to BB Academy</p>
</div>
</panel>
<panel language="css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.parent {
  background-color: lightblue;
  height: 80px;
}

p {
  width: 50%;
  background-color: chartreuse;
  margin-top: 30px;
}
</panel>
</codeblock>

As we can see from the above code,
we cannot see the margin space between
`p` element
and
the div container with class `parent`.

This happens because of the concept
of **margin collapse**.

## What is Margin Collapse?
Margin collapse occurs when the vertical margins
of adjacent elements meet or overlap.
Instead of stacking on top of each other,
the margins collapse into a single margin.

So, how do we add a margin space above the
`p` element in our above code?
The answer is **padding**.

We will learn about **padding** and how
to use it in the next lesson.
