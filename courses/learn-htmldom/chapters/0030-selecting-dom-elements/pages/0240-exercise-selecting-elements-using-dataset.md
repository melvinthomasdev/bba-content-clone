Access the **dataset** attribute
of "car-three", and log it
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="cars">
<ul>
  <li id="car-one" data-car-one="range-rover">Range Rover</li>
  <li id="car-two" data-car-two="audi">Audi</li>
  <li id="car-three" data-car-three="rolls-royce">Rolls Royce<li>
</ul>
</div>
</panel>
<panel language="javascript">
// Write your code here
</panel>
</code>
<solution>
<panel language="html">
<div id="cars">
<ul>
  <li id="car-one" data-car-one="range-rover">Range Rover</li>
  <li id="car-two" data-car-two="audi">Audi</li>
  <li id="car-three" data-car-three="rolls-royce">Rolls Royce<li>
</ul>
</div>
</panel>
<panel language="javascript">
const el = document.querySelector('#car-three');

const carThreeName = el.dataset["rolls-royce"];

console.log(carThreeName);
</panel>
</solution>
</codeblock>
