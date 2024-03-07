In the code provided below,
add a label with the text
`Select Reservation Date and Time:`.

Below this add a date
and
time picker input.

<codeblock language="html" type="exercise" testMode="fixedInput" defaultCSS="form {max-width: 300px; margin: 10px auto; font-family: Lato; border-radius: 10px; padding: 1rem; box-shadow: 0px 0px 4px; background-color: snow; font-size: 1.2rem; } form * { margin: 0.5rem; } button , input[type=`button`] { padding: 0.2rem 1rem; font-size: 1.1rem; font-weight: 700; margin: 1rem 0; }">
<code>
<form id="reservationForm">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" required>
  <br>

  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>
  <br>

  <label for="phone">Phone:</label>
  <input type="tel" id="phone" name="phone" required>
  <br>

  <!-- Write code below this line -->

  <br>
  <button>Submit</button>
</form>
</code>
<solution>
<form id="reservationForm">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" required>
  <br>

  <label for="email">Email:</label>
  <input type="email" id="email" name="email" required>
  <br>

  <label for="phone">Phone:</label>
  <input type="tel" id="phone" name="phone" required>
  <br>

  <!-- Write code below this line -->
  <label>Select Reservation Date and Time:</label>
  <input type="datetime-local">
  <br>
  <button>Submit</button>
</form>
</solution>
</codeblock>
