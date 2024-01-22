Update the below code to
display it entirely in
a pop-up dialog box.

<codeblock language="html" type="exercise" testMode="fixedInput" matchSolutionCode="true">
<code>
<panel language="html">
<p>You have been successfully logged out.</p>
<button class="dismiss">Dismiss</button>
</panel>
<panel language="css" hidden="true">
.dismiss {
  background-color: red;
  color: white;
  border: none;
  margin: 5px;
  padding: 5px;
}
</panel>
</code>
<solution>
<dialog open>
  <p>You have been successfully logged out.</p>
  <button class="dismiss">Dismiss</button>
</dialog>
</solution>
</codeblock>
