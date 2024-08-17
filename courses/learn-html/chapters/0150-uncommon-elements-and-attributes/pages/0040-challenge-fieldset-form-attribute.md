Update the example by linking
the fieldset elements to
the form element below:

<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<form id="quiz">
  <caption>Personal details</caption>
  <label>Name:</label>
  <br>
  <input type="text" placeholder="Sam Smith" >
  <br>

  <label>Roll No.:</label>
  <br>
  <input type="number" min="1" max="50" placeholder="1" >
</form>

<fieldset>
  <legend>Quiz Section: History</legend>
  <br>
  <label>What year was the Declaration of Independence signed?</label>
  <br>
  <input type="text">
  <br>
  
  <label>Who was the first President of the United States?</label>
  <br>
  <input type="text">
</fieldset>

<fieldset>
  <legend>Quiz Section: Science</legend>
  <br>
  <label>What is the chemical symbol for oxygen?</label>
  <br>
  <input type="text">
  <br>

  <label>Name the largest planet in our solar system.</label>
  <br>
  <input type="text">
  <br>
</fieldset>
</code>

<solution>
<form id="quiz">
  <caption>Personal details</caption>
  <label>Name:</label>
  <br>
  <input type="text" placeholder="Sam Smith" >
  <br>

  <label>Roll No.:</label>
  <br>
  <input type="number" min="1" max="50" placeholder="1" >
</form>

<fieldset form="quiz">
  <legend>Quiz Section: History</legend>
  <br>
  <label>What year was the Declaration of Independence signed?</label>
  <br>
  <input type="text">
  <br>
  
  <label>Who was the first President of the United States?</label>
  <br>
  <input type="text">
</fieldset>

<fieldset form="quiz">
  <legend>Quiz Section: Science</legend>
  <br>
  <label>What is the chemical symbol for oxygen?</label>
  <br>
  <input type="text">
  <br>

  <label>Name the largest planet in our solar system.</label>
  <br>
  <input type="text">
  <br>
</fieldset>
</solution>
</codeblock>