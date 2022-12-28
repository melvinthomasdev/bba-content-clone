We can create new HTML elements
using the `createElement` property
of the `document` object.

<codeblock language="javascript" type="lesson">
<code>
const newPElement = document.createElement('p');
newPElement.textContent = "Hi, there!";
console.log(newPElement);
</code>
</codeblock>