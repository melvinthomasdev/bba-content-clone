Add the class **light-text** to
the span element using the `classList`
property.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<p><span>Moving Mountains</span> is the goal!</p>
</panel>
<panel lang="css">
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
<panel lang="javascript">
let spanText = document.querySelector('span');
</panel>
</code>

<solution>
let spanText = document.querySelector('span');
spanText.classList.add('light-text');
</solution>
</Editor>