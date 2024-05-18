In the code below,
when we click the button,
events on both the **button**
as well as **fruit-cart**
gets triggered.

Your task is to change the code
in a way that only the event on
the button element is triggered.

<codeblock language="javascript" type="exercise" testMode="fixedInput" defaultCss="* {padding: 20px; border: 1px solid #ccc;} form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<panel language="html">
<form id="fruit-cart">
  <label>Select Fruit:</label>
  <select>
    <option value="apple">Apple 🍎</option>
    <option value="orange">Orange 🍊</option>
    <option value="mango">Mango 🥭</option>
    <option value="banana">Banana 🍌</option>
  </select>
  <button id="button" type="button">Purchase</button>
</form>
</panel>
<panel language="javascript">
// Get references to the parent div and the child button
const parentDiv = document.getElementById('fruit-cart');
const button = document.getElementById('button');

const handleFormEvent = () => {
  console.log("Form event Triggered!");
};

const handleButtonEvent = (event) => {
  console.log("Button clicked!");
};

// Attach event listeners
parentDiv.addEventListener('click', handleFormEvent);
button.addEventListener('click', handleButtonEvent);
</panel>
</code>
<solution>
// Get references to the parent div and the child button
const parentDiv = document.getElementById('fruit-cart');
const button = document.getElementById('button');

const handleFormEvent = () => {
  console.log("Form event Triggered!");
};

const handleButtonEvent = (event) => {
  console.log("Button clicked!");
  event.stopPropagation();
};

// Attach event listeners
parentDiv.addEventListener('click', handleFormEvent);
button.addEventListener('click', handleButtonEvent);
</solution>
</codeblock>
