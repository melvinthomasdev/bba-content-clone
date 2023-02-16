Create 3 inputs of type **radio** below the `br` element in the form.

Add a `name` attribute with the value **skill** to each of the radio inputs.

Add the `value` attribute to each radio input and give them the
values **writing**, **reading** and **speaking** respectively.

Also, remember to add appropriate labels to each radio input:


<codeblock language="html" type="exercise" testMode="fixedInput">
<code>
<form>
  <label>What is your strength?</label>
  <br>
</form>
</code>

<solution>
<form>
  <label>What is your strength?</label>
  <br>
  <input type="radio" value="writing" name="skill">
  <label>writing</label>
  <input type="radio" value="reading" name="skill">
  <label>reading</label>
  <input type="radio" value="speaking" name="skill">
  <label>speaking</label>
</form>
</solution>
</codeblock>