Use `attr()` function to display **Hello!** before **Welcome to BigBinary Academy**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p data-greet="Hello!"> Welcome to BigBinary Academy</p>
</panel>
<panel language="css">
p {
  font-size: 1.5rem;
}

p::before {
  color: blue;
  /*Write your code here*/
}
</panel>
</code>

<solution>
p {
  font-size: 1.5rem;
}

p::before {
  color: blue;
  /*Write your code here*/
  content: attr(data-greet);
}
</solution>
</codeblock>
