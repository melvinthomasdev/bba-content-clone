When we set the offset `top` property
of an element with position property
set as `relative`,
the element actually moves away from
the top edge of the screen or the
container element.

That is because the element is pushed
from the top towards bottom:
<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div class="static">
    Static element
  </div>
  
  <div class="relative">
    Relative element
  </div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
  justify-content: space-around;
}
.relative {
  padding: 10px;
  background-color: orange;
  position: relative;
  top: 50px;
  border: 5px solid darkorange;
}
.static {
  padding: 10px;
  background-color: blue;
  border: 5px solid darkblue;
  color: white;
}
</panel>
</code>
</codeblock>

In the above code,
we can see that the position
of the element with class
`relative` appears **50px**
away from the top edge.
This is because we have added
the **position** property as
`relative` with **top** offset
of `50px` to the element with
class **relative**.


The other offset values are
**right**, **bottom**, and **left**,
that can be applied to further adjust the element's
placement within its container.

Lets look at another example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div class="content">
    <h1>Welcome to My Website!</h1>
    <h2 class="relative-sub-heading">Today we will be learning about offset values!</p>
  </div>
  <div class="button-section">
    <button class="styled-button relative-button previous">Previous Page</button>
    <button class="styled-button relative-button next">Next Page</button>
  </div>
</div>
</panel>
<panel language="css">
.container {
  height: 100vh;
  background-color: gold;
  color: maroon;
}

.content {
  text-align: center;
  margin-bottom: 100px;
}

/* Relative positioning for heading with top and left offsets */
.relative-sub-heading {
  font-size: 1rem;
  position: relative;
  top: 20px;
  left: 50px;
}

.styled-button {
  padding: 5px;
  border-radius: 5px;
  background-color: maroon;
  color: gold;
}

/* Relative positioning for button bottom and left offsets */

.relative-button {
  position: relative;
}

.next {
  bottom: 30px;
  left: 450px;
}

.previous {
  bottom: 30px;
  left: 50px;
}

button:hover {
  box-shadow: 2px 2px lightblue;
}
</panel>
</code>
</codeblock>

In the above example, we applied offset values of
**top** and **left** to the `relative-sub-heading` class,
and **bottom** and **left** to the `next` and `previous` button classes,
allowing precise adjustments to the position of both elements.
