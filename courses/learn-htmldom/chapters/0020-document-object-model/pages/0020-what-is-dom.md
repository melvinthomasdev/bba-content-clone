If you think about it,
how is a programming language
going to be able to access the
HTML elements?

The answer is the **DOM**,
the Document Object Model.

When the browser reads
an HTML element,
it converts the element
to its object representation.
The conversion takes place
through a series of steps.
And the browser does this
for all the elements
and
their children.

Look at the following code:

```javascript
<h1 id = "title">This is not tough!</h1>
<p>It's really easy.</p>
```

This is how the browser sees it:

```javascript
h1 = {
    id: "title",
    innerText: "This is not tough!",
    tagName: 'H1'
}

p = {
    innerText: "It's really easy.",
    tagName: 'P'
}
```

There are more properties
that get associated
with each object.
This is only
a representation.

In the example given below,
focus on the output
in the console:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<p>This is a diversion.</p>
</panel>
<panel language="javascript">
/*
  The following code will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

// selects the first p tag and assigns it to the variable "pElement".
const pElement = document.querySelector('p');

console.log(pElement);
</panel>
</code>
</codeblock>

Every HTML element
is viewed as an object
and
look at the number of properties
that the browser attaches to the object.
You probably would deal with
a fraction of these properties,
so don't worry about them.
Just understand that
this is how the browser views
an HTML element.
