Look at this representation
of an HTML page:

<codeblock language="html" type="lesson">
<code>
<html>
    <head>
        <title>Attack of the Machines</title>
    </head>
    <body>
        <h1>Are you prepared for the attack of the machines?</h1>
        <p>The day is coming when your <span style="font-weight: 700">toaster</span> might not agree with you. You should best prepare for it now.</p>
    </body>
</html>
</code>
</codeblock><image>dom-tree.png</image>

The `HTML` element is
at the top
as the parent of
all the other elements.
The same kind of relationship
is seen for other elements as well.
For example,
the `p` element is above
the `span` element.
Thus, the `p` element
is the parent of
the `span` element.

Representing the parent-child
relationship in the DOM
gives us a tree-like structure.
This is the **DOM tree**.