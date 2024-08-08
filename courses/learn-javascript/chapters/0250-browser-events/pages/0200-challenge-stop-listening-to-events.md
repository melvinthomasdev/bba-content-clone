Change the code given below so
that after two presses of the `Enter`
key, nothing changes on the DOM.

After one press of the `Enter` key, the
text inside the `div` element
should change to `Enter key pressed once!`.
With the second press of the `Enter` key, the
text inside the `div` element should
become `Enter key pressed twice.
Listener Removed. After this,
nothing will happen!`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1>Click here & Press the "Enter" key</h1>
<p id="message">This text will update when you click inside this Preview section and press the "ENTER" key.</p>
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
const messageParagraph = document.getElementById('message');

function handleKeyDown(event) {
    if (event.key === 'Enter') {
        messageParagraph.textContent = 'Enter key pressed once!';
    }
}

document.addEventListener('keydown', handleKeyDown);
</panel>
</code>

<solution>
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
    }
  }
}

document.addEventListener('keydown', handleKeyDown);
</solution>

</codeblock>