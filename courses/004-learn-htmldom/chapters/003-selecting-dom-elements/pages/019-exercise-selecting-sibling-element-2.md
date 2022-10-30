Select the next sibling element for the
first button element and store it in the
**nextElem** variable. Then, select the previous
sibling element for the
second button element and store it in the
**prevElem** variable.

Check if the buttons are working:

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<button id = "hide-text">Hide the text</button>
<p>Is this text visible?</p>
<button id = "show-text">Show the text</button>
</panel>
<panel lang="javascript">
let hideText = document.querySelector("#hide-text");
let showText = document.querySelector("#show-text");

let nextElem = ;
let prevElem = ;

hideText.addEventListener('click', () => {
  nextElem.style.display = "none";
});

showText.addEventListener('click', () => {
  prevElem.style.display = "block";
});
</panel>
</code>

<solution>
let hideText = document.querySelector("#hide-text");
let showText = document.querySelector("#show-text");

let nextElem = hideText.nextElementSibling;
let prevElem = showText.previousElementSibling;

hideText.addEventListener('click', () => {
  nextElem.style.display = "none";
});

showText.addEventListener('click', () => {
  prevElem.style.display = "block";
});
</solution>
</Editor>