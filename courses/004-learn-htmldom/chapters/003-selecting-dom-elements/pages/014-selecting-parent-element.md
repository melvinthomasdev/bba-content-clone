To directly select a DOM element,
we can use selector methods like
`querySelector` or `getElementById`. But
sometimes, we need to select an element
based on its relationship with
another element in the DOM tree.

For example, how do we select the
parent of an element?

Take a look at the example given below:

<Editor lang="javascript">
<code>
<panel lang="html">
<section>
    <p>Nothing to note here.</p>
</section>
</panel>
<panel lang="javascript">
let section = document.querySelector('section');
let p = document.querySelector('p');
let parentOfP = p.parentElement;
console.log(`The '${p.parentElement.nodeName.toLowerCase()}' element is the parent of the '${p.nodeName.toLowerCase()}' element.`);
</panel>
</code>
</Editor>

As you can see in the console,
the `parentElement` property helps
us in selecting the parent
of an element.