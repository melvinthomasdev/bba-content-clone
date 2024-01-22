Create an input of the type
`date` in the form provided
below.

Add validation to the input
field to accept only the dates
between **1st January 2010**
and **31st December 2020**.

<codeblock language="html" type="exercise" testMode="fixedInput" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <!-- Write your code here -->
  <br>
  <button>Submit</button>
</form>
</code>

<solution>
<form>
  <input type="date" min="2010-01-01" max="2020-12-31">
  <br>
  <button>Submit</button>
</form>
</solution>
</codeblock>
