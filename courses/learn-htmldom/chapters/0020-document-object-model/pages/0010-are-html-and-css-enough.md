After learning HTML
and
CSS, we can now create
a good looking webpage.

That's great!

But, our webpages don't
have any interactivity.

For example:
If we want to create
a button that changes
something on our webpage,
we can't do that
with just HTML and CSS.

Take a look at this example code:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p>Hello, <span id="adjective">beautiful</span> World!</p>
<button id="random-expression">Change my world</button>
</panel>
<panel language="css" hidden="true">
p {
  font-family: Roboto;
  font-weight: 100;
  font-size: 2rem;
}

span {
  color: tomato;
  font-weight: 700;
}

button {
  background-color: lightgreen;
  border: 0;
  padding: 0.5rem;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
  font-family: Courier;
  font-size: 1.1rem;
  outline: none;
}

button:hover {
  transform: scale(1.02);
}

button:active {
  transform: scale(0.98);
}
</panel>
<panel language="javascript">
/*
  The following code will make sense as we study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

const quotes = ['beautiful', 'sad', 'green', 'strong', 'crazy', 'meaningful', 'fun'];

// Selects the element which has the id "random-expression" and assigns it to the variable "randomizer".
// As we can see from the above HTML code, in this example, the element is a `button element`.
const randomizer = document.getElementById('random-expression');

// Selects the element which has the id "adjective" and assigns it to the variable "adjective".
// As we can see from the above HTML code, in this example, the element is a `span element`.
let adjective = document.getElementById('adjective');

const handleClick = () => {
  // selects a quote randomly out of the array "quotes" and assigns it to the variable "randomExpression"
  const randomExpression = quotes[Math.floor(Math.random() * quotes.length)];

  // inserts the "randomExpression" value as the text content of the span element (one with id: "adjective")
  adjective.innerText = randomExpression;

}

// adds a method to call the function `handleClick` when someone clicks the button element.
randomizer.addEventListener('click', handleClick);
</panel>
</code>
</codeblock>

To allow the user to access
and
change our webpage content,
we need to use
a programming language
like **JavaScript**.
