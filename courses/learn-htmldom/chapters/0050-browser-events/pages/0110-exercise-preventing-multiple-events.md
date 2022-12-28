Change the code given below, so that
when we click on any of the
buttons, it should get the class
`sunshine` added to it.
Use only one event listener for this.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div id="root">
</div>
</panel>
<panel language="css">
#first-parent,
#second-parent {
  display: flex;
  justify-content: space-around;
  padding: 1rem;
}

button {
  width: 50px;
  height: 50px;
  background-color: lightblue;
  border-radius: 50%;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
}

h2 {
  text-align: center;
}

.sunshine {
  background-color: gold;
  border-radius: 0;
  margin: 0;
  border: 0;
}
</panel>
<panel language="javascript">
let root = document.querySelector('#root');
for(let i = 0; i < 60; i++) {
  let btn = document.createElement('button');
  btn.textContent = "Event";
  root.append(btn);
}
</panel>
</code>

<solution>
let root = document.querySelector('#root');
root.addEventListener("click", (e) => {
  if(e.target.tagName === "BUTTON") {
    e.target.classList.add("sunshine");
  }
});
for(let i = 0; i < 60; i++) {
  let btn = document.createElement('button');
  btn.textContent = "Event";
  root.append(btn);
}
</solution>

<domtestevents>
<event>
document.querySelector('#root').click();
</event>
</domtestevents>
</codeblock>