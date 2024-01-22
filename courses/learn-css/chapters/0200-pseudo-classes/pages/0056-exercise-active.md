
Apply a background color of **#ffc9b5** to the
subscribe button in the active state:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<input type="email" id="email" placeholder="Email ID">
<button type="button" id="subscribe">Subscribe</button>
</panel>
<panel language="css">
#email {
  padding: 8px 12px;
  font-size: 1em;
  border: 1px solid brown;
}

#subscribe {
  padding: 8px 12px;
  font-size: 1em;
  border: 1px solid brown;
  background-color: #ffe3d6;
}
</panel>
</code>

<solution>
#email {
  padding: 8px 12px;
  font-size: 1em;
  border: 1px solid brown;
}

#subscribe {
  padding: 8px 12px;
  font-size: 1em;
  border: 1px solid brown;
  background-color: #ffe3d6;
}

#subscribe:active {
  background-color: #ffc9b5;
}
</solution>
</codeblock>
