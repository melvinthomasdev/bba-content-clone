Right now, we are adding
`p` elements for new to do list items. This
isn't a smart thing to do. This way,
we would end up with a lot of paragraph elements
with no real link between each other. Instead,
an unordered list with each to do item
represented as a list item will be a better design
choice.

- Add a `ul` element in the
HTML panel below the submit input.
- Update the JavaScript code to
`append` new todo items as
list items.

<Editor lang="javascript">
<code>
<panel lang="html">
<input type = "text" placeholder = "Add a todo item"/>
<input type = "submit" value = "Add">
<ul>
</ul>
</panel>
<panel lang="css">
p {
  font-size: 1.2rem;
}
</panel>
<panel lang="javascript">
let userInput = document.querySelector('input[type="text"]');
let submitBtn = document.querySelector('input[type="submit"]');
let toDoList = document.querySelector('ul');

submitBtn.addEventListener('click', (e) => {
  let newToDoItem = document.createElement('li');
  newToDoItem.textContent = userInput.value;
  toDoList.append(newToDoItem);
});
</panel>
</code>
</Editor>