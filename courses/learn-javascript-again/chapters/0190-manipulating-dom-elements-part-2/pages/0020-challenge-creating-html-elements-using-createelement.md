Create a new `section` element and store
it in the variable `newSection`.

Add `<h2>` element with text
`New Section` as inner HTML
for `newSection`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html" hidden="true">
<div>
  <h1>This is the Main Content</h1>
</div>
</panel>
<panel language="javascript">
let newSection = // Create a new section element here;

let div = document.querySelector("div")
div.appendChild(newSection)
</panel>
</code>

<solution>
let newSection = document.createElement('section');
newSection.innerHTML = `<h2>New Section</h2>`;

let div = document.querySelector("div");
div.appendChild(newSection);
</solution>
</codeblock>
