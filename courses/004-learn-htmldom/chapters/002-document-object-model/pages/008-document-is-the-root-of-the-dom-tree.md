The `document` object
is a representation of
the entire HTML document
and
is the parent of
all other objects
in the DOM tree.

No other node object
can exist outside
the `document` object.

Look at the example given below:

<Editor lang="javascript">
<code>
<panel lang="html">
<div id="root">
    <h2>Opinions are aplenty</h2>
</div>
</panel>
<panel lang="css">
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
<panel lang="javascript">
/*
  The following code will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/
const rootDiv = document.querySelector('#root');
const explanation = document.createElement('p');
explanation.textContent = "Please try and explain more."
rootDiv.appendChild(explanation);
</panel>
</code>
</Editor>

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
