The text fields and textareas in forms can be styled in multiple ways using `width`, `height`, `padding`, `border`, `color`, `background-color` and fonts. Given below are some examples:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<form>
    <p>Rounded corners:</p>
    <input id="input1" type="text" placeholder="Type something">
    <p>Only bottom border:</p>
    <input id="input2" type="text" placeholder="Type something">
    <p>Larger font size and background color:</p>
    <textarea placeholder="Type something"></textarea>
</form>
</panel>
<panel language="css">
p {
    margin: 20px 0 10px;
}
#input1 {
  width: 300px;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid darkgray;
}
#input1:focus, #input1:hover {
  outline: none;
  border: 1px solid black;
}
#input2 {
  width: 250px;
  border: none;
  border-bottom: 1px solid black;
}
textarea {
  width: 250px;
  height: 80px;
  padding: 8px 12px;
  font-family: serif;
  font-size: 18px;
  background-color: lightyellow;
}
</panel>
</code>
</codeblock>

Let's look at each of the properties individually.