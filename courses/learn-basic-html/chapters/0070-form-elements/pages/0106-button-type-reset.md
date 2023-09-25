A `<button>` element with the type
attribute set as `reset` has a
a special job: it helps to clear
the form. 

Take a look at this example:
<codeblock language="html" type="lesson">
<code>
<form>
  <label>Sample Name:</label>
  <br>
  <input type="text" placeholder="Sample reference number" />
  <br>
  <label>Experiment 1:</label>
  <br>
  <select for="experiment-1">
    <option value="" selected disabled hidden>Choose here</option>
    <option value="Pass">Pass</option>
    <option value="Fail">Fail</option>
  </select>
  <br>

  <label>Experiment 2:</label>
  <br>
  <select for="experiment-1">
    <option value="" selected disabled hidden>Choose here</option>
    <option value="Pass">Pass</option>
    <option value="Fail">Fail</option>
  </select>
  <br>

  <button type="reset">Reset</button>
  <button type="submit">Submit</button>
</form>
</code>
</codeblock>

In the code above, if you click
on the button of the type `reset`,
it will remove all information
that you have entered in the form.
This way, it will reset the form
to its original condition.