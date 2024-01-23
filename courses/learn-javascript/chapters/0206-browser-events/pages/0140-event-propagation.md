When an event occurs,
like the click of a button
element, the event added
to the button element gets
triggered.

Additionally, the events
added to the parent element
of the button and the
parent element of the parent
element
and
so on are all
triggered too.

This process is called as
**event propagation**.

Let us have a look at an example:

<codeblock language="javascript" type="lesson" defaultCSS="parent {padding: 20px; border: 1px solid #ccc;}" >
<code>
<panel language="html">
<div id="parent-div">
  <button id="button">Click me!</button>
</div>
</panel>
<panel language="javascript">
// Get references to the parent div and the child button
const parentDiv = document.getElementById('parent-div');
const button = document.getElementById('button');

const handleDivEvent = () => {
  console.log("Div clicked!");
};

const handleButtonEvent = () => {
  console.log("Button clicked!");
}
// Attach event listeners
parentDiv.addEventListener('click', handleDivEvent);
button.addEventListener('click', handleButtonEvent);
</panel>
</code>
</codeblock>

In the code above,
when we click on the button,
we can see that both `Button clicked!`
and
`Div clicked!` are shown in the console.
This means that the event on the `button`
and
the event on the `div` were both triggered.
