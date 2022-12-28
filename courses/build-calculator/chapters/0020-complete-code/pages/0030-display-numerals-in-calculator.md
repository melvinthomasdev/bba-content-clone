There are different types of buttons
on the calculator. There are numerals, there
are mathematical actions, and then
there are other actions like deleting,
reset, etc.

We'll handle these one at a time. Let's begin
with displaying the numerals on
the calculator display:

(1) To distinguish a button with a numeral
from other buttons, use the `isNan()`
function.

(2) When we click on the numerals,
the text in the `p` element with the
id **result** should update with the
numeral value.

(3) Ensure that we can add numbers
with multiple digits.

(4) Let's also add a reset button which
when clicked, will make the text inside
the result `p` element go back to **0**.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div class="container">
  <div class="calculator">
    <p id = "result">0</p>
    <section id="actions">
      <section class="action-values">
        <button class = "action-value numeral" id = "numeral-one">1</button>
        <button class = "action-value numeral" id = "numeral-two">2</button>
        <button class = "action-value numeral" id = "numeral-three">3</button>
        <button class = "action-value numeral" id = "numeral-four">4</button>
        <button class = "action-value numeral" id = "numeral-five">5</button>
        <button class = "action-value numeral" id = "numeral-six">6</button>
        <button class = "action-value numeral" id = "numeral-seven">7</button>
        <button class = "action-value numeral" id = "numeral-eight">8</button>
        <button class = "action-value numeral" id = "numeral-nine">9</button>
        <button class = "action-value" id = "decimal-point">.</button>
        <button class = "action-value numeral" id = "numeral-zero">0</button>
        <button class = "action-value" id = "action-equals">=</button>
      </section>
      <section class="action-buttons">
        <button class = "action-button" id = "clear-all">C</button>
        <button class = "action-button" id = "action-remainder">%</button>
        <button class = "action-button" id = "action-add">+</button>
        <button class = "action-button" id = "action-subtract">-</button>
        <button class = "action-button" id = "action-divide">÷</button>
        <button class = "action-button" id = "action-multiply">×</button>
        <button class = "action-button" id = "action-backspace">Del</button>
        <button class = "action-button" id = "action-exponent">Exp</button>
      </section>
    </section>
  </div>
</div>
</panel>
<panel language="css">
body {
  background-color: #ecf0f1;
  color: #2d2d2d;
}

.container {
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: "Helvetica";
  font-size: 18px;
}

.calculator {
  border-radius: 1rem;
  padding: 0.5rem;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
  background-color: snow;
}

p {
  border: 1px solid lightgray;
  padding: 0.5rem 1rem;
  text-align: right;
}

button {
  border: none;
  border-radius: 0.3rem;
  margin: 0.5rem;
  padding: 0.5rem;
  font-size: 18px;
  color: #2d2d2d;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
  outline: none;
}

button:hover {
  transform: scale(1.05);
}

button:active {
  transform: scale(0.9);
}

#actions {
  display: grid;
  grid-template-columns: auto auto;
  grid-gap: 0.3rem;
}

.action-values {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}

.action-buttons {
  display: grid;
  grid-template-columns: 1fr 1fr;
}

.action-values button {
  background-color: #ecf0f1;
}

.action-buttons button {
  background-color: palevioletred;
  color: snow;
}
</panel>
<panel language="javascript">
let actions = document.getElementById("actions");
let result = document.getElementById("result");

actions.addEventListener("click", (event) => {
  if(event.target.nodeName === "BUTTON") {
    if(!isNaN(event.target.textContent)) {
      result.textContent += event.target.textContent;
      console.log("Number pressed");
    } else if(event.target.textContent === "C") {
      result.textContent = "0";
    }
    console.log("Click Registered");
  }
});
</panel>
</code>
</codeblock>