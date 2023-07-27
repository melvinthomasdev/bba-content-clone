In our app right now, all our new
to do list items get appended at the
end of the unordered list. We would
want the items to be added at the top
of the list so that the newest items
are visible at the top and not at the
bottom. This creates a better user
experience.

- Make the new to do list items appear
at the top of the list
- Update the HTML so that it is well
structured

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
p {
  font-size: 1.2rem;
}
</panel>
<panel language="javascript">
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
</codeblock>

Here, we structured all our HTML inside a
`div` with the class **container**. Then
we used the `insertBefore` method
to insert the new to do item before the
first element in the to do list.