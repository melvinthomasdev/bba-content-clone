Write a function named `verifyPassword` that takes a single string parameter, password, and verifies if it meets the following criteria:

1. Contains at least one uppercase letter (A-Z).
2. Contains at least one lowercase letter (a-z).
3. Contains at least one digit (0-9).
4. Contains at least one special character from the set: !@#$%^&*()_+\-=[]{};':"\\|,.<>/?.

The function should return a boolean value:

- `true` if the password meets all the criteria.
- `false` if the password does not meet one or more of the criteria.

Additionally, the function should log detailed messages to the console indicating whether the password is valid or invalid, and if invalid, specifying which criteria were not met.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code below this line

</code>
<solution>
// Write code below this line

const verifyPassword = (password) => {

  const hasUpperCase = /[A-Z]/.test(password);
  const hasLowerCase = /[a-z]/.test(password);
  const hasDigit = /\d/.test(password);
  const hasSpecialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password);

  const isValid = hasUpperCase && hasLowerCase && hasDigit && hasSpecialChar;

  let message = "";

  if (isValid) {
    message = "The password is valid."
  } else {
    console.log("The password is invalid.");
    if (!hasUpperCase) {
      message = "The password needs at least one uppercase letter";
    }
    if (!hasLowerCase) {
      message = "The password needs at least one lowercase letter";
    }
    if (!hasDigit) {
      message =  "The password needs at least one digit";
    }
    if (!hasSpecialChar) {
      message = "The password needs at least one special character";
    }
  }
  console.log(message);
};
</solution>
<testcases>
<caller>
verifyPassword(password);
</caller>
<testcase>
<i>
const password = "Password123!";
</i>
</testcase>
<testcase>
<i>
const password = "password123!";
</i>
</testcase>
<testcase>
<i>
const password = "PASSWORD123!";
</i>
</testcase>
<testcase>
<i>
const password = "Password!";
</i>
</testcase>
<testcase>
<i>
const password = "Password123";
</i>
</testcase>
<testcase>
<i>
const password = "Passw0rd@";
</i>
</testcase>
</testcases>
</codeblock>
