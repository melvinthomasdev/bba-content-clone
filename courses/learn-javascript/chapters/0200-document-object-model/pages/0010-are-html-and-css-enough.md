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
<panel language="html" hidden="true">
<p>Hello, <span id="adjective">beautiful</span> World!</p>
<button id="amazing-button">Make my world amazing</button>
<button id="beautiful-button">Make my world beautiful</button>
</panel>
<panel language="css" hidden="true">
* {
  text-align: center;
}

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
  border: 0;
  padding: 0.5rem;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
  font-family: Courier;
  font-size: 1.1rem;
  outline: none;
  border-radius: 5px;
  margin: 5px;
}

button:hover {
  transform: scale(1.02);
}

button:active {
  transform: scale(0.98);
}

#beautiful-button {
  background-color: lightgreen;
}

#amazing-button {
  background-color: lightblue;
}
</panel>
<panel language="javascript" hidden="true">
/*
  The following code will make sense as we study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

// As we can see from the above HTML code, in this example, the element is a `span element`.
let adjective = document.getElementById('adjective');

const handleBeautifulClick = () => {
  adjective.innerText = "beautiful";
};

const beautifulButton = document.getElementById("beautiful-button");
beautifulButton.addEventListener('click', handleBeautifulClick);

const handleAmazingClick = () => {
  adjective.innerText = "amazing";
};

const amazingButton = document.getElementById("amazing-button");
amazingButton.addEventListener('click', handleAmazingClick);
</panel>
</code>
</codeblock>

To allow the user to access
and
change our webpage content
as shown in the example above,
we need to use a programming
language like **JavaScript**.
