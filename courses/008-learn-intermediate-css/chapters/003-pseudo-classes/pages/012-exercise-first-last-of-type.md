Add a bottom padding of **15px**
and a **solid** bottom border
of **1px** of **lightgray**
color to the last paragraph
within the `div`:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div>
  <p>
    Albert Einstein was a German-born theoretical physicist, widely acknowledged to be one of the greatest physicists of all time.
  </p>
  <p>
    Einstein is known for developing the theory of relativity, but he also made important contributions to the development of the theory of quantum mechanics.
  </p>
  <p>
    Relativity and quantum mechanics are together the two pillars of modern physics.
  </p>
  <a href="#">Read More</a>
</div>
</panel>
<panel lang="css">

</panel>
</code>

<solution>
p:last-of-type {
  padding-bottom: 15px;
  border-bottom: 1px solid lightgray;
}
</solution>
</Editor>