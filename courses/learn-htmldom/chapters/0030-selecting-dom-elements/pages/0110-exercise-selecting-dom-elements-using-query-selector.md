Use `querySelector` for all the selections to
make the following changes:

1. Change the first
`div` element to have a background colour of **darkorange**.

2. Change the second
`div` element to have a background colour of **salmon**.

3. Change the third
`div` element to have a background colour of **thistle**.


Ensure
that all three selections use different types
of selectors.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<section>
  <div>Tag</div>
  <div class = "div-class">Class</div>
  <div class = "div-class" id = "div-id">ID</div>
</section>
</panel>
<panel language="css">
section {
  display: flex;
  gap: 1rem;
  justify-content: center;
  margin-top: 3rem;
  font-family: Helvetica;
}

div {
  border: 3px solid black;
  width: 100px;
  height: 100px;
  border-radius: 1rem;
  display:flex;
  justify-content: center;
  align-items: center;
  font-size: 1.3rem;
}
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let firstDiv = document.querySelector("div");
let firstDivWithClass = document.querySelector(".div-class");
let divWithId = document.querySelector("#div-id");

firstDiv.style.backgroundColor = "darkorange";
firstDivWithClass.style.backgroundColor = "salmon";
divWithId.style.backgroundColor = "thistle";
</solution>
</codeblock>