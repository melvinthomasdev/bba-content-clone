The textarea field can be resized when you drag the resizer at the bottom right corner in any direction. To prevent resizing horizontally, vertically or in both directions, we can use the `resize` property.

Default value for this property is **both** which allows resizing in both vertical and horizontal direction. Other accepted values are **horizontal**, **vertical**, and **none**.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
  <p>Try dragging the resizer and notice that you can resize it only vertically:</p>
  <textarea id = "vertical-resizer" rows="4" placeholder="Your Comments Here"></textarea>
  <p>Try dragging the resizer and notice that you can resize it only horizontally:</p>
  <textarea id = "horizontal-resizer" rows="4" placeholder="Your Comments Here"></textarea>
</form>
</panel>
<panel language="css">
textarea {
  width: 70%;
  padding: 15px;
  border: 1px solid lightgray;
}

#horizontal-resizer {
    resize: horizontal;
}

#vertical-resizer {
    resize: vertical;
}
</panel>
</code>
</codeblock>