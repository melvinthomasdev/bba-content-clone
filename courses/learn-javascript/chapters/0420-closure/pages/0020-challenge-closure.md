Define the function `authenticate`
to display **"Login Successful"**
if the arguments `email` and `password`
of the `login` function are equal to
the `email` and `password` properties of `user`.
Otherwise, return **"Invalid Credentials"**.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const login = (email, password) => {
  const user = {
    email: "adam@example.com",
    password: "123456",
  }

  const authenticate = () => {
  }

  return authenticate();
}

const message = login("adam@example.com", "password");
console.log(message);
</code>

<solution>
const login = (email, password) => {
  const user = {
    email: "adam@example.com",
    password: "123456",
  }

  const authenticate = () => {
    if (email === user.email && password === user.password)
      return "Login Successful";

    return "Invalid Credentials";
  }

  return authenticate();
}

const message = login("adam@example.com", "password");
console.log(message);
</solution>
</codeblock>