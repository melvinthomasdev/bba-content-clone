<!-- TODO: The classList output is visible in the console. Use that to show the class names in the lesson. -->
We can add class values to an
element using the `classList`
property.
Look at the following example
to see the `classList` property
in the console:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h1 class="highlight">Our app will take you places!</h1>
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
let soloHeading = document.querySelector('h1');
console.log(soloHeading.classList);
</panel>
</code>
</codeblock>

The `classList` property returns
a list of all the class attributes
of the `h1` element.

In the console for the above code
we can see the class name `highlight`.
We can add class names to this list
using the `add` method.

Let us take a look at the following
example to understand how to add classes:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h1 class="highlight">Our app will take you places!</h1>
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

appHeading.classList.add('complete');

console.log("Updated list of classes:");
console.log(appHeading.classList);
</panel>
</code>
</codeblock>

As we can see see in the console,
we get two class names now.
The `highlight` and the `complete`
classes are both now present on
the `h1` element.
