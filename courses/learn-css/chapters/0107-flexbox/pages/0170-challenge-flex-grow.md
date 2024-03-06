Make the text input
field stretch to
occupy all the available space:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<form>
  <h2>Message Box</h2>
  <div id="message-box">
    <input id="message-input" type="text" placeholder="Type your message">
    <button id="message-button" type="button">Send</button>
  </div>
</form>
</panel>
<panel language="css">
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
form {
  width: 90%;
  max-width: 600px;
  margin: 20px auto;
  padding: 30px;
  background-color: #f4f7fa;
}
#message-box {
  display: flex;
  margin-top: 10px;
}
#message-input {
  padding: 10px 15px;
  font-size: 1em;
}
#message-button {
  background-color: teal;
  padding: 10px 20px;
  color: white;
  font-size: 1em;
  border: 0;
}
</panel>
</code>

<solution>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
form {
  width: 90%;
  max-width: 600px;
  margin: 20px auto;
  padding: 30px;
  background-color: #f4f7fa;
}
#message-box {
  display: flex;
  margin-top: 10px;
}
#message-input {
  padding: 10px 15px;
  font-size: 1em;
  flex-grow: 1;
}
#message-button {
  background-color: teal;
  padding: 10px 20px;
  color: white;
  font-size: 1em;
  border: 0;
}
</solution>
</codeblock>