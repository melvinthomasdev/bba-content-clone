There is a problem with how we
stop the actions of an event listener.
 We use a counter to stop the actions
 after a set count. But
even though we don't do anything,
there is still an event listener on the
element.

You can see that it doesn't feel correct
to listen to an event and then do
nothing. Instead, a simpler approach
would be to stop listening to the event
itself.

We can use `removeeventlistener()`
for this:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h1>Press the "Enter" key</h1>
<p id="message">The event listener is active. Press "Enter" to see a message.</p>
</panel>
<panel language="css">
body {
    font-family: Roboto;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background-color: #f0f0f0;
    padding: 0 50px;
    flex-gap:20px;
}
</panel>
<panel language="javascript">
let enterPressCount = 0;
const messageParagraph = document.getElementById('message');

function handleKeyDown(event) {
    if (event.key === 'Enter') {
        enterPressCount += 1;
        if (enterPressCount === 1) {
            messageParagraph.textContent = 'Enter key pressed once!';
        }

        if (enterPressCount === 2) {
            messageParagraph.textContent = 'Enter key pressed twice. Listener Removed. After this, nothing will happen!';
            document.removeEventListener('keydown', handleKeyDown);
        }
    }
}

document.addEventListener('keydown', handleKeyDown);
</panel>
</code>
</codeblock>

The `removeEventListener()` method will
need two parameters. One,
it needs to know which event
needs to be removed.
And second, it needs the name
of the function
that needs to be removed. This
is why, you need
to pass a named function when
adding an event listener.
Otherwise, when you want to remove
the event listener,
you'll have no way to do it.