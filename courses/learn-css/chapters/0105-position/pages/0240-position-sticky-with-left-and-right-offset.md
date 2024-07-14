The `left` offset is used to define
the element's position from the left edge of the
viewing screen.

Similarly, `right` offset is used
to define the element's position from the
right edge of the viewing screen.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="stick-container">
  <div class="sticky left">
    Sticky Left
  </div>
  <div class="text"> Some text to allow the sticky header to stick! </div>
  <div class="text"> This paragraph will continue to scroll. </div>
  <div class="text"> Another paragraph just to have content to scroll. </div>
  <div class="text"> So many paragraphs to make this scrollable</div>
  <div class="text"> At least one more to make sure we can see</div>
  <div class="sticky right">
    Sticky Right
  </div>
</div>
</panel>
<panel language="css">
.stick-container {
  display: flex;
  padding: 8px 0;
  width: 60vw;
  height: 85vh;
  overflow-x: auto;
  border: 1px solid #333;
  margin: 0 auto;
}
.sticky {
  position: sticky;
  background-color: #EEE;
  border: 2px dashed black;
  padding: 8px;
}
.left {
  left: 10px;
}
.right {
  right: 10px;
}
.text {
  border: 1px dashed blue;
  padding: 8px;
  margin: 0 8px;
}
</panel>
</code>
</codeblock>

In the example above, as we scroll left,
the **div** element with the class `sticky-left`
remains stuck at a distance of **10px**
from the left edge of the `sticky-container`
due to the `position: sticky` property
and
a **10px** left offset.

Similarly, the `sticky-right` element sticks
at a distance of **10px** from the right edge
of the `sticky-container` for the same reason,
using `position: sticky` with a **10px**
right offset.
