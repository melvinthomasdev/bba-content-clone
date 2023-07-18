Update the provided code below
to show the pop-up dialog box
when the `Submit` button is
clicked, and hide it when
the `Close` button is clicked.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<button id="submit-button">Submit</button>
<dialog id="dialog-box">
  <img src="https://ucarecdn.com/f6bf72be-74d6-4c06-b163-5d5bd04a3b0c/">
  <h2>Thank You!</h2>
  <p>Your details have been saved successfully!</p>
  <button id="close-button">Close</button>
</dialog>
</panel>
<panel language="css" hidden="true">
img {
  display: block;
  height: 100px;
  width: 100px;
  margin: auto;
  margin-top: -25%;
  border-radius: 50%;
}
#submit-button {
  display: block;
  background-color: blue;
  color: white;
  font-weight: 700;
  border-radius: 25px;
  padding: 10px;
  color: white;
  width: 20%;
  margin: auto;
}
#close-button {
  background-color: red;
  color: white;
  font-weight: 700;
  padding: 5px 15px;
  border: none;
  border-radius: 10px;
}
#dialog-box {
  position: absolute;
  border: 1px solid blue;
  text-align: center;
}
</panel>
<panel language="javascript">
// Write code here
</panel>
</code>
<solution>
// Write code here
const submitButton = document.querySelector("#submit-button");
const closeButton = document.querySelector("#close-button");
const dialogElement = document.querySelector("#dialog-box");

submitButton.addEventListener("click", () => {
  dialogElement.show();
});
closeButton.addEventListener("click", () => {
  dialogElement.close();
});
</solution>
</codeblock>
