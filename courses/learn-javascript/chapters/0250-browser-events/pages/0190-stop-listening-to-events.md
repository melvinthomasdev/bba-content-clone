We know how to listen to an event now.
But how can we stop listening to this
event after a while?

In the following example, click
multiple times on the button.
You'll see that it stops to work
after 3 clicks.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<button id="myButton">Click Me!</button>
<p id="status">Click the button!</p>
<div id="container"></div>
</panel>
<panel language="css">
button {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    background:burlywood;
}
button:disabled {
    background-color: gray;
    cursor: not-allowed;
}
</panel>
<panel language="javascript">
const button = document.getElementById('myButton');
const status = document.getElementById('status');
const container = document.getElementById('container');
let clickCount = 0;

const handleClick = () => {
    clickCount++;
    status.innerText = `Button clicked ${clickCount} times`;
    if (clickCount >= 3) {
        button.disabled = true;
        button.innerText = 'No More Clicks';
        const newElement = document.createElement('div');
        newElement.innerText = 'After 3 clicks on the button, no more clicks are allowed.';
        container.appendChild(newElement);
    }
}

button.addEventListener('click', handleClick);
</panel>
</code>
</codeblock>

So, using a counter that keeps a track
of how many times the event was fired
can help.