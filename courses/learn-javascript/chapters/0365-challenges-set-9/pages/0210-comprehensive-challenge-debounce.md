Complete the JavaScript function to debounce a given callback function to only execute after a specified delay once the user stops typing in an input field.

Debouncing is a strategy used to ensure that a function is only executed after a certain period of time has passed since it was last called.

<image>debounce-function.gif</image>

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<input type="text" id="debounce-input" placeholder="Type something...">
<p id="output"></p>
</panel>
<panel language="javascript">
const debounce = (func, timeout = 1000) => {
  // Write your code here
}
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

inputField.addEventListener('input', debounce(() => {
  display.textContent = inputField.value;
}, 1000));
</solution>
<domtestevents>
<event>
document.getElementById('debounce-input').value = "Hello";
document.getElementById('debounce-input').dispatchEvent(new Event('input'));
</event>
</domtestevents>
</codeblock>
