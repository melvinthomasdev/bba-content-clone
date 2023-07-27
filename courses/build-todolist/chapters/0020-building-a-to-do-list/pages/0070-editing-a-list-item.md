Sometimes, we can end up with typos
in our entries. Or we might want to
change something about a particular
entry. Instead of saying **Repair the
ceiling by 11 pm**, you might want to say
**Repair the glass ceiling by 11 pm tomorrow**.

Editing a list item is a must have feature. Let's
implement it in our app:

- Add a `span` with a '🖉' next to each list
item. Give it the id **edit-btn**. Add this before
the **remove-btn** span.
- Add an event listener on this button so
that when we click on it, we are able to
edit the list item.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div class="container">
  <section id="user-input">
    <input type="text" placeholder="Add a todo item"/>
    <input type="submit" value="Add">
  </section>
  <section id="to-do-list">
    <ul>
    </ul>
  </section>
</div>
</panel>
<panel language="css">
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
<panel language="javascript">
let userInput = document.querySelector('input[type="text"]');
let submitBtn = document.querySelector('input[type="submit"]');
let toDoList = document.querySelector('ul');

handleSubmit = (e) => {
  let newToDoItem = document.createElement('li');
  newToDoItem.innerHTML = userInput.value + '<span id="edit-btn">🖉</span><span id="remove-btn">❌</span>';
  toDoList.insertBefore(newToDoItem, toDoList.childNodes[0]);
  let removeBtn = document.querySelector('#remove-btn');
  removeBtn.addEventListener('click', (e) => {
    e.target.parentElement.remove();
  });
  userInput.value = "";
}

submitBtn.addEventListener('click', handleSubmit);
</panel>
</code>
</codeblock>