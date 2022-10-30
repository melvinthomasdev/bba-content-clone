Select the parent element for
the `p` element and store the
value in the `parentOfP` variable.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<div>
  <p>Building a product is one of the joys of life.</p>
</div>
</panel>
<panel lang="css">
p {
  font-family: Helvetica;
  font-size: 32px;
}
</panel>
<panel lang="javascript">
let parentOfP = ;
console.log(`The parent of the 'p' element is the '${parentOfP.nodeName.toLowerCase()}' element`);
</panel>
</code>

<solution>
let parentOfP = document.querySelector('p').parentElement;
console.log(`The parent of the 'p' element is the '${parentOfP.nodeName.toLowerCase()}' element`);
</solution>
</Editor>