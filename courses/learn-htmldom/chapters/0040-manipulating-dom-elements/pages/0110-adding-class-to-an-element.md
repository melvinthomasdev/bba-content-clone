<!-- TODO: The classList output is visible in the console. Use that to show the class names in the lesson. -->
We can add class values to an
element using the `classList` property.
Look at the following example
to see the `classList` property
in the console:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div class = "fruit orange colour"></div>
</panel>
<panel language="javascript">
let soloDiv = document.querySelector('div');
console.log(soloDiv.classList);
</panel>
</code>
</codeblock>

Look at the following example to
understand how we add classes:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h1>Our app will take you places!</h1>
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
console.log("Initial list of classes: ");
console.log(appHeading.classList);
appHeading.classList.add('highlight', 'complete');
console.log("Updated list of classes: ");
console.log(appHeading.classList);
</panel>
</code>
</codeblock>

The `classList` property returns a list
of all the class attributes of the element.
We then add class names separated by commas
to this list using the `add` method.
