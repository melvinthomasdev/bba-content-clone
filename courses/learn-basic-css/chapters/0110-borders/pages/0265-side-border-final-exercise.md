Apply the following borders to
the `.login-form` class element:
1. `border-top: 8px solid #3498db;`
2. `border-right: 8px solid #e74c3c;`
3. `border-bottom: 8px solid #27ae60;`
4. `border-left: 8px solid #f39c12;`

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="login-container">
  <form class="login-form">
   <h2>Login</h2>
   <div class="form-group">
   <label for="username">Username</label>
   <input type="text" id="username" name="username" placeholder="Enter your username">
   </div>
   <div class="form-group">
   <label for="password">Password</label>
   <input type="password" id="password" name="password" placeholder="Enter your password">
   </div>
   <button class="submit-button" type="submit">Login</button>
  </form>
</div>
</panel>
<panel language="css">
/* Update code below */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
}
.login-container {
  width: 300px;
  padding: 20px;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
}
.login-form {
  padding: 20px;
  border-radius: 5px;
}
.form-group {
  margin-bottom: 15px;
}
.form-group label {
  display: block;
  margin-bottom: 5px;
}
.form-group input {
  width: 230px;
  padding: 10px;
  border: none;
  border-bottom: 1px solid #ccc;
  transition: border-color 0.2s;
  outline: 0;
}
.form-group input:focus {
  border-color: #3498db;
}
.submit-button {
  display: block;
  width: 100%;
  padding: 10px;
  background-color: #3498db;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.2s;
}
.submit-button:hover {
  background-color: #e74c3c;
}
</panel>
</code>
<solution>
/* Update code below */
body {
  margin: 0;
  padding: 0;
  font-family: Arial, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f5f5;
}
.login-container {
  width: 300px;
  padding: 20px;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
}
.login-form {
  border-top: 8px solid #3498db;
  border-right: 8px solid #e74c3c;
  border-bottom: 8px solid #27ae60;
  border-left: 8px solid #f39c12;
  padding: 20px;
  border-radius: 5px;
}
.form-group {
  margin-bottom: 15px;
}
.form-group label {
  display: block;
  margin-bottom: 5px;
}
.form-group input {
  width: 230px;
  padding: 10px;
  border: none;
  border-bottom: 1px solid #ccc;
  transition: border-color 0.2s;
  outline: 0;
}
.form-group input:focus {
  border-color: #3498db;
}
.submit-button {
  display: block;
  width: 100%;
  padding: 10px;
  background-color: #3498db;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.2s;
}
</solution>
</codeblock>
