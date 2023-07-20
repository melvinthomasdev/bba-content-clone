Create a new `section` element and store
it in the variable `newSection`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html" hidden="true">

</panel>
<panel language="javascript">
let newSection = // Create a new section element here;

let body = document.querySelector("body")
body.appendChild(newSection)
</panel>
</code>

<solution>
let newSection = document.createElement('section');

let body = document.querySelector("body")
body.appendChild(newSection)
</solution>
</codeblock>