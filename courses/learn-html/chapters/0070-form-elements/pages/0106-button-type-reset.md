A `<button>` element with the type
attribute set as `reset` has a
a special job: it helps to clear
the form.

Take a look at this example:
<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label>Sample Number:</label>
  <br>
  <input type="number" placeholder="121203" >
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
