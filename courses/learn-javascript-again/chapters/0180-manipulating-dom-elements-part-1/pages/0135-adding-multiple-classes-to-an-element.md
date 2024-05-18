We can add multiple class values
to an HTML element.

Let us look at an example
where we are adding multiple
class values to an HTML element
using JavaScript:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html" hidden="true">
<div id="myElement">Unleash Your Creativity in the Digital Playground!</div></panel>
<panel language="css" hidden="true">
.primary {
  color: blue;
}

.background {
  background-color: yellow;
  padding: 10px;
}
</panel>
<panel language="javascript">
const myElement = document.getElementById('myElement');

myElement.classList.add('primary', 'background');

console.log("Updated list of classes:");
console.log(myElement.classList);
</panel>
</code>
</codeblock>

In the code above,
you can see that we are
adding multiple classes
using the `add()` method.

For this, we need to simply
add the class values as
parameters in the method.

Try adding more class values
in the same method.

**Remember to add the commas!**
