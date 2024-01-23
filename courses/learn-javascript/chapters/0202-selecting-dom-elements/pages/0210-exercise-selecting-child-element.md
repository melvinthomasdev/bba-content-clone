Select all the child elements of the
`div` element and store the value in
the `children` variable.

In the `secondChild` variable, store
the second value of the `children` list.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <section>
    <p>This is nested text.</p>
  </section>
  <p>This paragraph should have a border.</p>
  <a href="#">Third Child Element</a>
</div>
</panel>
<panel language="javascript">
let divElem = document.querySelector("div");
let children = ;
let secondChild = ;
secondChild.style.border = "5px solid steelblue";
</panel>
</code>

<solution>
let divElem = document.querySelector("div");
let children = divElem.children;
let secondChild = children[1];
secondChild.style.border = "5px solid steelblue";
</solution>
</codeblock>