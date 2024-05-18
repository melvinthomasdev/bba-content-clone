Debouncing is a strategy used to ensure that a function is only executed after a certain period of time has passed since it was last called.

You need to optimize the search function below so that it is called only after the user stops typing as shown in the GIF below.


<image>debounce-function-new.gif</image>

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<input type="text" id="debounce-input" placeholder="Type something...">
<p id="output"></p>
</panel>
<panel language="javascript">
const inputField = document.getElementById('debounce-input');
const display = document.getElementById('output');

const searchFunction = () => {
  display.textContent = inputField.value;
}

inputField.addEventListener('input',searchFunction);
</panel>
</code>
<solution>
const debounce = (func, timeout = 1000) => {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() =>  func(...args), timeout);
  };
}

const inputField = document.getElementById('debounce-input');
const display = document.getElementById('output');

const searchFunction = () => {
  display.textContent = inputField.value;
}

inputField.addEventListener('input', debounce(searchFunction, 1000));
</solution>
<domtestevents>
<event>
document.getElementById('debounce-input').value = "Hello";
document.getElementById('debounce-input').dispatchEvent(new Event('input'));
</event>
</domtestevents>
</codeblock>
