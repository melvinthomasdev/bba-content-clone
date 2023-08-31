In the previous exercise,
we created a pop-up dialog
box to display Log Out
status.

However, this dialog box
doesn't have any functionality
and it doesn't do anything on
it's own.
This makes it feel
incomplete, doesn't it?

To make a `<dialog>` element
functional,
we can use JavaScript.

JavaScript provides two
built-in methods for the
`<dialog>` element:
- `open()`: This method opens
  the dialog box,
  making it visible.
- `close()`: This method closes
  the dialog box, hiding it.

These methods, help us add
interactivity by allowing
users to open and close
the dialog box as desired.

Let us take a look at the
the upgraded dialog box in
the code example below:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div class="nav">
  <h1>BigBinary Academy</h1>
  <button id="nav-logout-button">Log Out</button>
  <dialog id="dialog-box">
    <p>You have been successfully logged out.</p>
    <button id="dismiss">Dismiss</button>
  </dialog>
</div>
</panel>
<panel language="css" hidden="true">
.nav {
  display: flex;
  justify-content: space-around;
  background-color: blue;
  color: white;
}
#nav-logout-button {
  margin: 5px;
  background-color: green;
  color: white;
  border: none;
  height: 35px;
  margin: 20px;
  border-radius: 5px;
}
#dialog-box {
  position: absolute;
  width: 50%;
  margin: auto;
  text-align: center;
  border: 1px solid blue;
}
#dismiss {
  background-color: red;
  color: white;
  border: none;
  margin: 5px auto;
  padding: 5px;
  border-radius: 5px;
}
</panel>
<panel language="javascript">
const openButton = document.querySelector("#nav-logout-button");
const dismissButton = document.querySelector("#dismiss");
const dialogElement = document.querySelector("#dialog-box");

openButton.addEventListener("click", () => {
  dialogElement.show();
});

dismissButton.addEventListener("click", () => {
  dialogElement.close();
});
</panel>
</code>
</codeblock>

If you are confused by the
HTML DOM manipulation code
used above, please go through
our course [Learn HTML DOM](https://courses.bigbinaryacademy.com/learn-htmldom/).
