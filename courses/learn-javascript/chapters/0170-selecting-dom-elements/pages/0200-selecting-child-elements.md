To select all the
child elements of a particular element, we
can use the `children` property.

Take a look at the example given below:

<codeblock language="javascript" type="lesson">
<code>
<panel language="html">
<section>
  <a href="#">A link to nowhere.</a><span> Nothing to note here.</span><strong> Absolutely nothing of value in this div.</strong>
</section>
</panel>
<panel language="javascript">
let section = document.querySelector('section');
let children = section.children;
for(let child of children) {
  console.log(child.nodeName.toLowerCase());
}
</panel>
</code>
</codeblock>

As you can see, in the console,
the `children` property returns
a list of all child elements of an
element and we can access each one
of them using either brackets `[]` or
by looping over the list.