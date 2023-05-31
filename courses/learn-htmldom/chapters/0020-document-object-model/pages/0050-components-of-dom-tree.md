The DOM tree includes HTML
elements as objects. But it's not
just elements which get transformed
to DOM objects. Even the text and the comments
become part of the DOM tree as separate objects.
Here's a list
of all the
[12 different node objects](https://www.w3schools.com/XML/dom_nodetype.asp)
that we'll see
in a DOM tree.

All these objects are
based on the **Node** interface.
Therefore,
we get access to
many Node properties.
For example,
we can check
the name of the node
using the `Node.nodeName` property:

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container"><p>All Node Names should be visible.</p><!-- Comments are nodes too --><div>The extra text nodes are created because of the whitespace between the elements.</div></div>
</panel>
<panel language="javascript">
/*
  The following code will make sense as you study more in the course.
  Right now, simply look at it and move on to understanding the concept.
*/

let container = document.querySelector(".container");

let domTree = "";

recursiveDomTreeBuilder = (parentNode) => {
  for(let child of parentNode.childNodes) {
    if(!child.hasChildNodes()) {
      domTree += `${child.nodeName}<br>`;

    } else {
      domTree += `${child.nodeName}<br>`;

      recursiveDomTreeBuilder(child);
    }
  }
}
recursiveDomTreeBuilder(container);

container.innerHTML = domTree;
</panel>
</code>
</codeblock>

As can be seen in the console,
the `p` is an element node.
Whereas, the text inside
the `p` is a text node.
The text node is
a child of the `p` element node.
The comment is also a node.
The DOM tree will look
something like this:

![Text and comment nodes in DOM tree](https://ucarecdn.com/dc13c1b6-eabe-4dfe-b7b5-ddbcbafdb137/ "Text and comment nodes in DOM tree")
