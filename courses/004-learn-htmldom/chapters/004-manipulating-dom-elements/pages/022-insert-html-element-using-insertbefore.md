We can append child elements to another
element using the `appendChild` method. But
this way, we can only add the element as the
last child of the parent element. What if we
want to add an element before a certain element?

<Editor lang="javascript">
<code>
<panel lang="html">
<section>
  <input type = "submit" class="warning" value = "Stop" />
  <input type = "submit" class="warning" value = "Cancel" />
  <input type = "submit" class="warning" value = "Delete" />
</section>
</panel>
<panel lang="css">
section {
  display: flex;
  gap: 1rem;
}

button,
input[type="submit"] {
  border: none;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
  font-weight: 600;
  cursor: pointer;
  padding: 0.5rem ;
}

button:hover, input[type="submit"]:hover {
  transform: scale(1.02);
}

button:active, input[type="submit"]:active {
  transform: scale(0.98);
}

.warning {
  background-color: tomato;
  color: #2d2d2d;
}

.safe {
  background-color: seagreen;
  color: snow;
}
</panel>
<panel lang="javascript">
let container = document.querySelector('section');
let allInputs = document.querySelectorAll('input');
let newButton = document.createElement('button');
newButton.classList.add('safe');
newButton.textContent = "Safe"
container.insertBefore(newButton, allInputs[1]);
</panel>
</code>
</Editor>

In the example given above, we have created a
new button element and inserted it at a
certain position in the page.

The `insertBefore` method is called on
the parent element and takes two arguments:

- The element that is to be moved or inserted.
- The element before which we want to place the newly positioned element.
