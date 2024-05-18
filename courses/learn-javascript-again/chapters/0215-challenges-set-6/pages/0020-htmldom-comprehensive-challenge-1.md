Complete the **Sticky Notes** app using the HTML DOM knowledge you have gained so far.

Follow these instructions:

- Create a function that gets called on the click of the **+** add button to create a note card.
- Add a class of `sticky-note` to the note cards.
- The note cards should have random background colors fetched from the `getRandomColour` function.
- The note cards should have an **X** delete button with a class of `delete-button`.
- Make sure not to allow users to create empty cards.

<image>sticky-notes.gif</image>

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false" showRunCodeButton="false">
<code>
<panel language="html">
<div class="app-container">
  <h1>Sticky Notes</h1>
  <div class="sticky-notes">
    <!-- Notes should be added here dynamically -->
  </div>
  <div class="add-note">
    <textarea id="new-note" placeholder="Type a new note..."></textarea>
    <button class="add-button">+</button>
  </div>
</div>
</panel>
<panel language="css"  hidden="true">
/* CSS Reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
}

.app-container {
  max-width: 800px;
  margin: 20px auto;
  padding: 20px;
  background-color: #f1f1f1;
  border-radius: 5px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
  text-align: center;
}

h1 {
  color: #333;
  font-family: 'Zeyada', cursive;
}

.sticky-notes {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  justify-content: center;
  margin-top: 20px;
}

.sticky-note {
  padding: 10px;
  border-radius: 5px;
  box-shadow: 2px 2px 5px rgba(4, 4, 4, 0.2);
  width: 200px;
  height: 100px;
  text-align: left;
  overflow: auto;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  position: relative;
}

.delete-button {
  position: absolute;
  top: 5px;
  right: 5px;
  background-color: #fd8f7b;
  color: #fff;
  border: none;
  padding: 2px 4px;
  cursor: pointer;
  border-radius: 2px;
}

.delete-button:hover {
  background-color: #fb6c52;
  transform: scale(1.15);
}

.add-note {
  width: 200px;
  position: relative;
  margin: 20px auto;
}

button {
  display: inline-block;
  border: none;
  padding: 4px;
  cursor: pointer;
  border-radius: 50%;
}

.add-button {
  color: #08ff2dab;
  position: absolute;
  bottom: 10px;
  right: 5px;
  font-size: 32px;
  background-color: transparent;
  z-index: 2;
}

.add-button:hover {
  color: #11ff00bb;
  transform: scale(1.15);
  font-weight: 500;
}

textarea {
  width: 100%;
  height: 100px;
  overflow: auto;
  padding: 10px;
  margin-bottom: 10px;
  background: #ffffc1;
  border-radius: 6px;
  border-style: none;
  border-width: 1px;
  box-shadow: 2px 2px 5px rgba(4, 4, 4, 0.2);
  color: #555555;
  transition: background-color 0.2s ease 0s;
  position: relative;
  resize: none;
}

textarea:focus {
  outline-width: 0;
}
</panel>
<panel language="javascript">
function getRandomColour() {
  const colours = ["#FAFACE", "#D4D0F5", "#FDF9E0", "#CCF3F1", "#D1E9CF"];
  const randomIndex = Math.floor(Math.random() * colours.length);
  return colours[randomIndex];
}

//Write your code here
</panel>
</code>
<solution>
function getRandomColour() {
  const colours = ["#FAFACE", "#D4D0F5", "#FDF9E0", "#CCF3F1", "#D1E9CF"];
  const randomIndex = Math.floor(Math.random() * colours.length);
  return colours[randomIndex];
}

//Write your code here
function createStickyNote() {
  const noteText = document.getElementById("new-note").value;

  if (noteText.length !== 0) {
    const stickyNotesContainer = document.querySelector(".sticky-notes");

    const stickyNote = document.createElement("div");
    stickyNote.classList.add("sticky-note");
    stickyNote.style.backgroundColor = getRandomColour();
    stickyNote.innerHTML = `
      <button class="delete-button">X</button>
      <p>${noteText}</p>
    `;

    stickyNotesContainer.appendChild(stickyNote);

    const deleteButton = stickyNote.querySelector(".delete-button");
    deleteButton.addEventListener("click", () => {
      stickyNote.remove();
    });

    document.getElementById("new-note").value = "";
  }
}

document.querySelector(".add-button").addEventListener("click", createStickyNote);
</solution>
</codeblock>

We are not displaying answer to this exercise.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2d8ias5ud-ywkjF1xRyV9Nbne1_sGQag) to join the community.
