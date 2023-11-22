Look at this representation
of an HTML page:

<codeblock language="html" type="lesson">
<code>
<html>
  <head>
    <title>Space Race!</title>
  </head>
  <body>
    <h1>First Space mission</h1>
    <p>
      On Oct. 4, 1957, the U.S.S.R launched the first artificial satellite, <span style="font-weight: 700">Sputnik 1</span>, into space.
    </p>

    <h1>Second Space mission</h1>
    <p>
      On April 12, 1961, the Russian <span style="font-weight: 700">Lt. Yuri Gagarin</span> became the first human to orbit Earth in Vostok 1.
    </p>
  </body>
</html>
</code>
</codeblock>

![DOM tree](https://ucarecdn.com/4b193a2a-8bf2-46e6-9554-014a903d5c91/ "DOM tree")

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
