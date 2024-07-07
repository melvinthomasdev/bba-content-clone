We use the `appendChild` method
to add nested HTML elements
inside another element.

In the example given below,
we append a **red coloured box**
to the end of a list of boxes:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<section id="tree">
  <div></div>
  <div></div>
  <div></div>
</section>
</panel>
<panel language="css">
#tree {
  background-color: steelblue;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  margin: 1rem auto;
  padding: 1rem;
}

div {
  width: 100px;
  height: 100px;
  background-color: #ecf0f1;
  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
  margin: 0 auto;
  border-radius: 1rem;
}

div:last-child {
  background-color: tomato;
}
</panel>
<panel language="javascript">
let tree = document.getElementById('tree');
let leaf = document.createElement('div');
tree.appendChild(leaf);
</panel>
</code>
</codeblock>

The appended child gets added to
the last, after all other children
of the parent element.

It isn't necessary to append
only newly created elements.
We can even use this method
to move elements around the
document.
