Create a function named `verifyPassword` that takes a single string parameter, **password**, and verifies if it meets the following criteria,

  1. Contains at least one uppercase letter (A-Z).
  **Error Message:** The password needs at least one uppercase letter
  2. Contains at least one lowercase letter (a-z).
  **Error Message:** The password needs at least one lowercase letter
  3. Contains at least one digit (0-9).
  **Error Message:** The password needs at least one digit
  4. Contains at least one special character from the set: !@#$%^&*()_+\-=[]{};':"\\|,.<>/?.
  **Error Message:** The password needs at least one special character

- For a valid password, the function logs: **"The password is valid."** 
- For an invalid password, the function logs: **“The password is invalid.”**, followed on the next line by all the required error messages specifying the unmet criteria, joined by a comma (**,**).

For example,
```js
Input:

const password = "helloworld123";

Output:
"The password is invalid."
"The password needs at least one uppercase letter,The password needs at least one special character"
```

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

  let message = [];

  if (isValid) {
    message = "The password is valid."
    console.log("The password is valid.");
  } else {
    console.log("The password is invalid.");
    if (!hasUpperCase) {
      message.push("The password needs at least one uppercase letter");
    }
    if (!hasLowerCase) {
      message.push("The password needs at least one lowercase letter");
    }
    if (!hasDigit) {
      message.push( "The password needs at least one digit");
    }
    if (!hasSpecialChar) {
      message.push("The password needs at least one special character");
    }
    console.log(message.join(","));  
  }
};
</solution>
<testcases>
<caller>
verifyPassword(password);
</caller>
<testcase>
<i>
const password = "KWer123!MEQ";
</i>
</testcase>
<testcase>
<i>
const password = "password123!";
</i>
</testcase>
<testcase>
<i>
const password = "password";
</i>
</testcase>
<testcase>
<i>
const password = "Password!";
</i>
</testcase>
<testcase>
<i>
const password = "MQ";
</i>
</testcase>
<testcase>
<i>
const password = "Passw0rd@";
</i>
</testcase>
</testcases>
</codeblock>
