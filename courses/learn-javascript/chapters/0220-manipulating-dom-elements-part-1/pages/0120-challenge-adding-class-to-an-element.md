Add the class **light-text** to
the span element using the `classList`
property.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p><span>Moving Mountains</span> is the goal!</p>
</panel>
<panel language="css">
p {
  font-size: 50px;
  font-weight: 700;
  font-family: Roboto;
  line-height: 0;
}

.light-text {
  font-weight: 100;
}
</panel>
<panel language="javascript">
let spanText = document.querySelector('span');
</panel>
</code>

<solution>
let spanText = document.querySelector('span');
spanText.classList.add('light-text');
</solution>
</codeblock>