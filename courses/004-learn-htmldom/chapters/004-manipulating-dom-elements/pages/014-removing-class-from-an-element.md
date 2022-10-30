We can remove class values from an
element using the `classList` property.

<Editor lang="javascript">
<code>
<panel lang="html">
<h1 class = "highlight complete">Our app will take you places!</h1>
</panel>
<panel lang="css">
.highlight {
    color: orangered;
}

.complete {
    text-decoration: line-through;
}
</panel>
<panel lang="javascript">
let appHeading = document.querySelector('h1');
appHeading.classList.remove('highlight', 'complete');
</panel>
</code>
</Editor>

The `classList` property returns a list
of all the class attributes of the element.
We then remove class names separated by commas
from this list using the
`remove` method on the `classList` property.
