So, you know your HTML
and
CSS
and
can create a good looking webpage.

That's great!

But your webpages don't
have any interactivity.
For example,
if you wanted to create
a button that changes
something on your webpage,
you can't do that
with just HTML and CSS.


Take a look at this example code:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p>Hello, <span id="adjective">beautiful</span> World!</p>
<button id="random-expression">Change my world</button>
</panel>
<panel language="css">
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
  The following code will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

let quotes = ['beautiful', 'sad', 'green', 'strong', 'crazy', 'meaningful', 'fun'];
let randomizer = document.getElementById('random-expression');
let adjective = document.getElementById('adjective');
const handleClick = () => {
  let randomExpression = quotes[Math.floor(Math.random() * quotes.length)];
  adjective.innerText = randomExpression;
}
randomizer.addEventListener('click', handleClick);
</panel>
</code>
</codeblock>

To allow the user to access
and
change your webpage content,
you need to use
a programming language
like **JavaScript**.