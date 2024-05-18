Implement email validation using Javascript. If the email is invalid, display an error message saying `Please enter a valid email address.`. If it is valid, show an alert saying `Email address is valid`.

Hint: Use this regex to validate email address: `/^[^\s@]+@[^\s@]+\.[^\s@]+$/`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h2>Email Validation Form</h2>
<form id="emailForm">
    <label for="email">Email:</label>
    <input type="text" id="email" name="email">
    <button id="submitForm" type="submit">Submit</button>
</form>
<p id="errorMessage" class="error-message"></p>
</panel>
<panel language="css"  hidden="true">
.error-message {
  color: red;
}
</panel>
<panel language="javascript">
  // Write your code here
</panel>
</code>
<solution>
const emailForm = document.getElementById("emailForm");
const emailInput = document.getElementById("email");
const errorMessage = document.getElementById("errorMessage");

emailForm.addEventListener("submit", function (event) {
  event.preventDefault();
  const email = emailInput.value.trim();
  const isValid = isValidEmail(email);
  if (!isValid) {
    errorMessage.textContent = "Please enter a valid email address.";
  } else {
    errorMessage.textContent = "";
    alert("Email address is valid");
  }
});

function isValidEmail(email) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

</solution>
<domtestevents>
<event>
document.getElementById('errorMessage').textContent = "invalid email";
document.getElementById('submitForm').click()
</event>
</domtestevents>
</codeblock>
