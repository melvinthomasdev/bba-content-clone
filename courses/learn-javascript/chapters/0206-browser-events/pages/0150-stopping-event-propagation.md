Consider the following situation
in which we want the event added to
a specific **HTML** element to be triggered.

<codeblock language="javascript" type="lesson" defaultCSS="parent {padding: 20px; border: 1px solid #ccc;}" >
<code>
<panel language="html">
<div id="parent-div">
  <button id="button">Click me!</button>
</div>
</panel>
<panel language="javascript">
// Get references to the parent div and button
const parentDiv = document.getElementById('parent-div');
const button = document.getElementById('button');

const handleDivEvent = () => {
  console.log("Div clicked!");
};

const handleButtonEvent = () => {
  console.log("Button clicked!");
  event.stopPropagation();
}
// Attach event listeners
parentDiv.addEventListener('click', handleDivEvent);
button.addEventListener('click', handleButtonEvent);
</panel>
</code>
</codeblock>

We can observe that the event
on the **button** element is triggered.
However, the event on the **div**
element is not triggered.

This is because we have used
`event.stopPropagation()` on the
`handleButtonEvent()` function
which is an event listener for
the **button** element.
This stops the event from propagating
further to the **div** element.
