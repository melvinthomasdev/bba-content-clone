We can remove class values from an
element using the `classList` property.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h1 class="highlight complete">Our app will take you places!</h1>
</panel>
<panel language="css">
.highlight {
  color: orangered;
}

.complete {
  text-decoration: line-through;
}
</panel>
<panel language="javascript">
let appHeading = document.querySelector('h1');
appHeading.classList.remove('highlight', 'complete');
</panel>
</code>
</codeblock>

The `classList` property returns a list
of all the class attributes of the element.
We then remove class names separated by commas
from this list using the
`remove` method on the `classList` property.
