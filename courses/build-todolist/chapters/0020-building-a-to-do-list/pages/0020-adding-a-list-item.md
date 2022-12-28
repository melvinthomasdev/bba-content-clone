Alright people, let's build ourselves a
to do list!

To start out, we'll be building the
smallest, simplest version of a to do
list. Then slowly, we'll add bells
and whistles till it becomes a
full-fledged application that you can
use to store your daily to dos.

To create a basic to do list, we
need two things:

- A way to enter our to do list items.
- A way to display these items on the
screen.

For the first step, we will create an `input`
of type `text`. Let's add a placeholder in it
and add another input of the type `submit` so
that we have a way of submitting our input.

For the second step, we'll add a click event listener
to our submit button. This event listener will listen
to clicks on the button and will add a new `p` element
below the input with for every click. The `textContent`
of this `p` element will hold the todo item
that we just added in the text input element.

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<input type = "text" placeholder = "Add a todo item"/>
<input type = "submit" value = "Add">
</panel>
<panel language="css">
p {
  font-size: 1.2rem;
}
</panel>
<panel language="javascript">
// Variable Declarations
let userInput = document.querySelector('input[type="text"]');
let submitBtn = document.querySelector('input[type="submit"]');

// Handle the click event here
submitBtn.addEventListener('click', (e) => {
  let newToDoItem = document.createElement('p');
  newToDoItem.textContent = userInput.value;
  submitBtn.insertAdjacentElement('afterend', newToDoItem);
});
</panel>
</code>
</codeblock>

This is a basic to do list app.
Our app does one thing: it takes
an input from us and adds it as a
to do item on the screen. Now, there
are many things that are not ideal here, and
we'll be improving them in the
coming lessons.

Here's a [link](https://developer.mozilla.org/en-US/docs/Web/API/Element/insertAdjacentElement) for `insertAdjacentElement`
if you want to read up on it.