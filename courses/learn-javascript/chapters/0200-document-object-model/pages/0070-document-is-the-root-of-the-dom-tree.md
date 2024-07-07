The `document` object
is a representation of
the entire HTML document
and
is the parent of
all other objects
in the DOM tree.

No other DOM object
can exist outside
the `document` object.

Look at the example given below:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<div id="root">
  <h2>Opinions are aplenty</h2>
</div>
</panel>
<panel language="css">
#root {
  font-family: Helvetica;
}

h2 {
  font-size: 2rem;
}

p {
  font-size: 1.4rem;
  color: grey;
}
</panel>
<panel language="javascript">
/*
  The following code will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

// selects the element which has the id "root" and assigns it to the variable "rootDiv".
// As you can see from the above HTML code, in this example, the element is a `div element`.
const rootDiv = document.querySelector('#root');

// creates a "p" element and assigns it to the variable "explanation"
const explanation = document.createElement('p');

// inserts the quoted text to the text content of the "explanation" element
explanation.textContent = "Please try and explain more."

// adds "explanation" element as the child element to the "rootDiv" element
// Thus adds the above quoted text to the DOM
rootDiv.appendChild(explanation);
</panel>
</code>
</codeblock>

In the above example,
we have used
the `document.querySelector` method
to search the whole document
and
find the element
with the id `root`.
Then, we used
the `document.createElement` method to
create a new element
in the document.

We can see that
for actions or data
that relates to
the whole document,
we need to use
the `document` object.
