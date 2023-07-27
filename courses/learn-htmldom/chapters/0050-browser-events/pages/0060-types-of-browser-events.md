Browsers experience many different types
of events. There are keyboard events like
`keyup`, `keydown`, mouse events like `click`, etc.
[Here's a long list of event types](https://developer.mozilla.org/en-US/docs/Web/Events)
if you want to take a look.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<label for="result">
  Result:
<input type="text" id="result">
</label>
</panel>
<panel language="javascript">
let result = document.querySelector('input');
displayEventType = (event) => {
  console.log(event.type);
}
result.addEventListener('keydown', displayEventType);
result.addEventListener('keypress', displayEventType);
result.addEventListener('keyup', displayEventType);
result.addEventListener('mousedown', displayEventType);
result.addEventListener('mouseup', displayEventType);
result.addEventListener('click', displayEventType);
</panel>
</code>
</codeblock>

In the example given above, you can see
that even with simple actions like
clicking inside the input box, multiple
events get registered. This is how vivid
it can get. There are so many possibilities
for us to read these events and design our
applications around them.