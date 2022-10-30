At a certain time, there can be many events
going on in the browser,
like mouse clicks, mouse movements,
key-presses, etc. We need the browser to
wait for a particular event to occur,
and
after that perform a set of instructions.

Look at the example given below and
try to copy the text in the
paragraph:

<Editor lang="javascript">
<code>
<panel lang="html">
<p></p>
</panel>
<panel lang="javascript">
let result = document.querySelector('p');
result.textContent = "Try copying this text.";
result.addEventListener('copy', event => console.log('Data Copied'));
</panel>
</code>
</Editor>

In the example given above, we are listening to
an event on the `p` DOM object using the
`addEventListener` method.
This listener method will monitor
the DOM object for a particular event.

In `addEventListener`, we specify the name of the event
and
the code that we want to execute
once that particular event occurs.
Here, the name of the event is **copy**.
As soon as someone
copies the code from the `p` element,
our function inside the `addEventListener` runs.

Let's look at another example and
try to select the text inside the
input:

<Editor lang="javascript">
<code>
<panel lang="html">
<input value="Select me">
</panel>
<panel lang="javascript">
let result = document.querySelector('input');
result.addEventListener('select', event => console.log('Data Selected'));
</panel>
</code>
</Editor>

In the example given above, we are listening to
an event on the `input` DOM object.
When you select the text inside the `input` element,
the function inside the `addEventListener` runs.
The function runs even when you select a single character
inside the `input` element.

It must be kept in mind
that the **select** event
only gets fired on
`input` elements
and
`textarea` elements.