Add an outline of `1px solid brown`
and a background color `#ffc9b5`
to the text input **email** on focus:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<input type="email" id="email" placeholder="Email ID">
</panel>
<panel language="css">
#email {
  padding: 8px 12px;
  font-size: 1em;
  border: 1px solid brown;
}
</panel>
</code>

<solution>
#email {
  padding: 8px 12px;
  font-size: 1em;
  border: 1px solid brown;
}
#email:focus {
  outline: 1px solid brown;
  background-color: #ffc9b5;
}
</solution>
</codeblock>