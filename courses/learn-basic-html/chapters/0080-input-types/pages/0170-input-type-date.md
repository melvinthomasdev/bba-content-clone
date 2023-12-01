`<input type="date">` creates
input fields that let the user
enter a date.

The input field contains a textbox
that validates the input and a
date picker.

The format for adding dates is `yyyy-mm-dd`.

<codeblock language="html" type="lesson" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form>
  <label for="birth-date">Birthday:</label>
  <input type="date" min="1950-01-01" max="2000-01-01" placeholder="YYYY-MM-DD"><br>
  <button>Submit</button>
</form>
</code>
</codeblock>

- The `min` and `max` attributes
set the limits for the acceptable
input values such that the `min`
attribute validates the earliest
acceptable date as input value
and the `max` attribute validates
 the latest acceptable date.

-  If a date prior to `min` and
later than `max` value is entered,
as seen in the example above,
the validation fails and we see
a warning when we click `Submit`.

- When we open the date picker
by clicking on the calender icon,
we will only be able to navigate
and select the dates within the
limit defined by `min` and
`max` attributes.
