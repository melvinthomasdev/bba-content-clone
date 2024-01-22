Change the counter list style to `upper-roman` for the below provided tasks.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <h2>Read</h2>
  <p>Read a book for 30 minutes.</p>

  <h2>Write</h2>
  <p>Write in your journal for 15 minutes.</p>

  <h2>Walk</h2>
  <p>Take a short walk in the park.</p>

  <h2>Exercise</h2>
  <p>Do a quick 10-minute exercise routine.</p>
</div>
</panel>
<panel language="css">
div {
  counter-reset: task-counter;
}

p {
  font-size: 20px;
}

h2::before {
  content: "Task " counter(task-counter) ": ";
  counter-increment: task-counter;
  color: #0077b6;
}
</panel>
</code>

<solution>
div {
  counter-reset: task-counter;
}

p {
  font-size: 20px;
}

h2::before {
  content: "Task " counter(task-counter, upper-roman) ": ";
  counter-increment: task-counter;
  color: #0077b6;
}
</solution>
</codeblock>
