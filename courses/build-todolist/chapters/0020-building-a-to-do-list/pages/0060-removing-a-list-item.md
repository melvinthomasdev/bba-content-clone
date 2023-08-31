We should be able to remove a
list item when we are
done with it:

- Add a span with an '❌' next to each list
item. Give it the id **remove-btn**.
- Add an event listener on this button so
that when we click on it, the list item
should be removed from the list.
- Empty the input field after an entry has
been added.

There are many ways of removing a list
item. We could simply hide it using
`display:none` or `visibility:hidden` in
the CSS. Or we could remove it altogether
from the DOM using the [remove](https://courses.bigbinaryacademy.com/learn-htmldom/manipulating-dom-elements-part-2/remove-html-element/) method.
We'll use the `remove` method.

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

submitBtn.addEventListener('click', (e) => {
  let newToDoItem = document.createElement('li');
  newToDoItem.innerHTML = userInput.value + '<span id="remove-btn">❌</span>';
  toDoList.insertBefore(newToDoItem, toDoList.childNodes[0]);
  let removeBtn = document.querySelector('#remove-btn');
  removeBtn.addEventListener('click', (e) => {
    e.target.parentElement.remove();
  });
  userInput.value = "";
});
</panel>
</code>
</codeblock>