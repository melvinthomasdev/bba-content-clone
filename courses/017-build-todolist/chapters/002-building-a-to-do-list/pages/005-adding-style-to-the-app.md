Let's give our app some style:

- Remove the li marker and the padding from the `ul`
- Center all the sections
- Improve the font sizing and change font type to **Helvetica**

<Editor lang="javascript">
<code>
<panel lang="html">
<div class = "container">
  <section id = "user-input">
    <input type = "text" placeholder = "Add a todo item"/>
    <input type = "submit" value = "Add">
  </section>
  <section id = "to-do-list">
    <ul>
    </ul>
  </section>
</div>
</panel>
<panel lang="css">
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
  font-size: 1.2rem;
  font-family: Helvetica;
}
section {
  min-width: 500px;
}

#user-input {
  text-align: center;
}

input {
  font-size: 1.5rem;
  font-family: Helvetica;
}

ul {
  padding: 0;
}

li {
  list-style-type: none;
  list-style-position: inside;
}

input[type="text"] {
  min-width: 400px;
}
</panel>
<panel lang="javascript">
let userInput = document.querySelector('input[type="text"]');
let submitBtn = document.querySelector('input[type="submit"]');
let toDoList = document.querySelector('ul');

submitBtn.addEventListener('click', (e) => {
  let newToDoItem = document.createElement('li');
  newToDoItem.textContent = userInput.value;
  toDoList.insertBefore(newToDoItem, toDoList.childNodes[0]);
});
</panel>
</code>
</Editor>