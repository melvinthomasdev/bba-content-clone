Update the code below by
adding the `italic`
and
`light-background` classes
to the `p` element with the
**id** - `description`.

Avoid updating the HTML element
directly,
instead use JavaScript.

<codeblock language="javascript" type="exercise" testMode="fixedInput" matchSolutionCode="true">
<code>
<panel language="html">
<h2>Basketball</h2>
<hr>
<p id="description">
  Basketball is a team sport in which two teams, most commonly of five players each, opposing one another on a rectangular court, compete with the primary objective of shooting a basketball through the defender's hoop, while preventing the opposing team from shooting through their own hoop.
</p>
</panel>
<panel language="css">
* {
  text-align: center;
}

.italic {
  font-style: italic;
}

.light-background {
  background-color: #f0f0f0;
  padding: 10px;
}
</panel>
<panel language="javascript">
const description = document.getElementById("description");

description.classList.add();

console.log("Updated list of classes:");
console.log(description.classList);
</panel>
</code>
<solution>
const description = document.getElementById("description");

description.classList.add("italic", "light-background");

console.log("Updated list of classes:");
console.log(description.classList);
</solution>
</codeblock>
