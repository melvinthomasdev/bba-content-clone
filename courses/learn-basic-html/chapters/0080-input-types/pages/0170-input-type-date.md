`<input type="date">` creates
input fields that let the user
enter a date.

The input field contains a textbox
that validates the input and a
date picker.

The format for adding dates is `yyyy-mm-dd`.

<codeblock language="html" type="lesson">
<code>
<form>
  <label for="birth-date">Birthday:</label>
  <input type="date" min="1950-01-01" max="2000-01-01"><br>
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
