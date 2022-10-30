<!-- TODO: The classList output is visible in the console. Use that to show the class names in the lesson. -->
We can add class values to an
element using the `classList` property.
Look at the following example
to see the `classList` property
in the console:

<Editor lang="javascript">
<code>
<panel lang="html">
<div class = "fruit orange colour"></div>
</panel>
<panel lang="javascript">
let soloDiv = document.querySelector('div');
console.log(soloDiv.classList);
</panel>
</code>
</Editor>

Look at the following example to
understand how we add classes:

<Editor lang="javascript">
<code>
<panel lang="html">
<h1>Our app will take you places!</h1>
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
console.log("Initial list of classes: ");
console.log(appHeading.classList);
appHeading.classList.add('highlight', 'complete');
console.log("Updated list of classes: ");
console.log(appHeading.classList);
</panel>
</code>
</Editor>

The `classList` property returns a list
of all the class attributes of the element.
We then add class names separated by commas
to this list using the `add` method.
