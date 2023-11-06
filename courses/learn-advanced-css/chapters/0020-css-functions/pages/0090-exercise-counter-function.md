Use the `counter` function,
along with `counter-reset`
and `counter-increment`,
to add numbering to the list.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h1>JS Frameworks:</h1>
<div class="framework-list">
  <h2>Vue</h2>
  <h2>React</h2>
  <h2>Angular</h2>
</div>
</panel>
<panel language="css">
.framework-list {
  margin-left: 20px;
}
h2 {
  margin: 10px 0;
}
h2::before {
  color: #0077b6;
  margin-right: 10px;
}
</panel>
</code>

<solution>
.framework-list {
  counter-reset: framework-counter;
  margin-left: 20px;
}
.h2 {
  counter-increment: framework-counter;
  margin: 10px 0;
}
.h2::before {
  content: counter(framework-counter) ". ";
  color: #0077b6;
  margin-right: 10px;
}
</solution>
</codeblock>
