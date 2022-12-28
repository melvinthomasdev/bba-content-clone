Look at the code given below:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<h2 class="all-headings">No control over when this text changed!</h2>
<h2 class="all-headings">Complete control over when this text changes</h2>
<button value = "xx-large">Large Text</button>
<button value = "large">Normal Text</button>
<button value = "xx-small">Small Text</button>
</panel>
<panel language="javascript">
let unControlledHeading = document.querySelectorAll(".all-headings")[0];
unControlledHeading.style.fontSize = "xx-small";

let controlledHeading = document.querySelectorAll(".all-headings")[1];

let allButtons = document.querySelectorAll("button");
for (let button of allButtons) {
  button.addEventListener("click", handleClick);
}
function handleClick(event) {
  controlledHeading.style.fontSize = event.target.value;
}
</panel>
</code>
</codeblock>

As you can see, the size of the first heading
changed to **xx-small** as soon as our
web page loaded. In fact, we have no control over when
that change happened.

On the other hand, the size
of the second heading changes
when we click on the buttons.

The control matters!

It doesn't have to
be just clicks though. We can make it, so that when
the user hovers over the headings, their size changes.
Or that the change occurs when the user
presses a certain key on the keyboard.
There are many ways in which we can achieve this.
All these are called **events**.