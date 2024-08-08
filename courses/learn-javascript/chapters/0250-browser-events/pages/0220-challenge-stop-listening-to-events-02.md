Using `removeeventlistener()`, change the
code so that the `Fun Mode` button only
activates when we press the `Activate Fun Mode`
game button.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <button id="button1">Activate Fun Mode</button>
  <button id="button2" class="inactive">Fun Mode</button>
</div>
</panel>

<panel language="css">
* {
  margin: 0;
  font-family: Roboto;
}

div {
  width: 100vw;
  height: 100vh;
  display: grid;
  justify-content: center;
  align-items: center;
}

.active {
  background-color: dodgerblue;
  color: black;
}

.inactive {
  background-color: tomato;
  color: black;
}

button {
  background-color: #2d2d2d;
  color:snow;
  padding:10px 20px;
  font-size: 18px;
  border: none;
  cursor: pointer;
  box-shadow: 4px 4px 4px black;
  font-weight: 700;
  border-radius: 4px;
}
</panel>

<panel language="javascript">
const container = document.getElementsByTagName('div');
const button1 = document.getElementById('button1');
const button2 = document.getElementById('button2');

let isButton2Active = false;

const handleButton1Click = () => {
  isButton2Active = !isButton2Active;
  if (isButton2Active) {
    button2.classList.remove('inactive');
    button2.classList.add('active');
    button2.addEventListener('click', handleButton2Click);
    button1.textContent="Deactivate Fun Mode";
    button2.textContent="Fun Mode Active";
  } else {
    button2.classList.remove('active');
    button2.classList.add('inactive');
    button1.textContent="Activate Fun Mode";
    button2.textContent="Fun Mode Inactive";
  }
}
const getRandomColor = () => {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    return `rgb(${r}, ${g}, ${b})`;
  }
const handleButton2Click = () => {
   container[0].style.backgroundColor = getRandomColor();
}
button1.addEventListener('click', handleButton1Click);
</panel>
</code>

<solution>
const container = document.getElementsByTagName('div');
const button1 = document.getElementById('button1');
const button2 = document.getElementById('button2');

let isButton2Active = false;

const handleButton1Click = () => {
  isButton2Active = !isButton2Active;
  if (isButton2Active) {
    button2.classList.remove('inactive');
    button2.classList.add('active');
    button2.addEventListener('click', handleButton2Click);
    button1.textContent="Deactivate Fun Mode";
    button2.textContent="Fun Mode Active";
  } else {
    button2.classList.remove('active');
    button2.classList.add('inactive');
    button1.textContent="Activate Fun Mode";
    button2.textContent="Fun Mode Inactive";
    button2.removeEventListener('click', handleButton2Click);
  }
}
const getRandomColor = () => {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);
    return `rgb(${r}, ${g}, ${b})`;
  }
const handleButton2Click = () => {
   container[0].style.backgroundColor = getRandomColor();
}
button1.addEventListener('click', handleButton1Click);
</solution>
</codeblock>