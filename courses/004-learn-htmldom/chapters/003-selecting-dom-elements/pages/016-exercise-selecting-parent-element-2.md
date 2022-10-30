Select the parent element for
the `h2` element
and
the `p` element.
Use the strict equality operator, `===`
to check if they are equal.
Display the result on the console.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<section>
  <h2>Basics of Brilliance</h2>
  <p>Is acceptance the key?</p>
</section>
</panel>
<panel lang="css">
section {
  font-family: Helvetica;
}
</panel>
<panel lang="javascript">
let parentOfP = ;
let parentOfH2 = ;
console.log();
</panel>
</code>

<solution>
let parentOfP = document.querySelector('p').parentElement;
let parentOfH2 = document.querySelector('h2').parentElement;
console.log(parentOfP === parentOfH2);
</solution>
</Editor>