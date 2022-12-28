When you take your mouse over a text input or a button, the background or border colour can be changed using the `:hover` pseudo-class selector:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<input type="text" id="email" placeholder="Email ID" />
<input type="button" id="subscribe" value="Subscribe" />
</panel>
<panel language="css">
#email {
  border: solid 1px #dddddd;
  padding: 10px;
}
#subscribe {
  padding: 10px;
  border: none;
  background-color: #6789ff;
  color: white;
}
/* Hover styles below */
#email:hover {
  border: solid 1px #888888;
}
#subscribe:hover {
  background-color: #4567de;
  cursor: pointer;
}
</panel>
</code>
</codeblock>

Take your mouse pointer over the text field and the button to see the hover styles take effect. We have used the `cursor` property above to change the mouse pointer to hand symbol. Try removing it to notice the difference.

Also, when you tap on an input field or move focus to it using the `tab` key on your keyboard, a blue outline appears around the input field. This style can be changed using the `:focus` pseudo-class selector:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<input type="text" id="email" placeholder="Email ID" />
<input type="button" id="subscribe" value="Subscribe" />
</panel>
<panel language="css">
#email {
  border: solid 1px #dddddd;
  padding: 10px;
}
#subscribe {
  padding: 10px;
  border: none;
  background-color: #6789ff;
  color: white;
}
/* Same hover & focus styles */
#email:hover, #email:focus {
  border: solid 1px #888888;
  outline: none;
}
#subscribe:hover, #subscribe:focus {
  background-color: #4567de;
  cursor: pointer;
}
</panel>
</code>
</codeblock>

We have used the same styles for hover
and
focus actions.
The `outline` property with the value `none`
removes the outline for text input
in the example given above.