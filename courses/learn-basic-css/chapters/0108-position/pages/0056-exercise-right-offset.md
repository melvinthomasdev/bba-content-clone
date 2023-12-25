Add offset `right` property with
a value of `20px`
and
`bottom` offset with a value of
`10px` to the button element with
class `settings`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="inbox">
    <h3>Inbox</h3>
    <p>Sam Smith (2)</p>
    <p>Eve Smith (1)</p>
  </div>
  <div class="buttons">
    <button type="button" class="account">Account</button>
    <button type="button" class="settings">Settings</button>
  </div>
</div>
</panel>
<panel language="css">
.container {
  font-family: Arial, sans-serif;
  height: 100vh;
  background-color: #f2f2f2;
}
.inbox {
  text-align: center;
  padding: 10px;
}
p {
  background-color: #fff;
  font-weight: 900;
  padding: 10px;
  border: 1px solid darkgray;
}
.buttons {
  display: flex;
  justify-content: space-around;
}
button {
  background-color: #007bff;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
}
.account {
  position: relative;
  left: 20px;
  bottom: 10px;
}
</panel>
</code>
<solution>
.container {
  font-family: Arial, sans-serif;
  height: 100vh;
  background-color: #f2f2f2;
}
.inbox {
  text-align: center;
  padding: 10px;
}
p {
  background-color: #fff;
  font-weight: 900;
  padding: 10px;
  border: 1px solid darkgray;
}
.buttons {
  display: flex;
  justify-content: space-around;
}
button {
  background-color: #007bff;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
}
.account {
  position: relative;
  left: 20px;
  bottom: 10px;
}
.settings {
  position: relative;
  right: 20px;
  bottom: 10px;
}
</solution>
</codeblock>
