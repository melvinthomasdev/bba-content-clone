When you want to select
the 7th element of its
type within its parent, or
select the first 15 elements or
every 3rd element and so on,
you can use the `:nth-of-type`
pseudo-class:

In the following example,
we want to `float` every
second link within the `div`
to the right:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  <p>
    Albert Einstein was a German-born theoretical physicist, widely acknowledged to be one of the greatest physicists of all time.
  </p>
  <a href="#">Works</a>
  <a href="#">Read more</a>
  <p>
    Sir Isaac Newton PRS was an English mathematician, physicist, astronomer, theologian, and author who is widely recognised as one of the greatest mathematicians and most influential scientists of all time and as a key figure in the scientific revolution.
  </p>
  <a href="#">Works</a>
  <a href="#">Read more</a>
</div>
</panel>
<panel language="css">
a:nth-of-type(even) {
  float: right;
}
</panel>
</code>
</codeblock>

Using `:nth-child` here will
not get the desired results.

Try using these in the example above:

**`:nth-of-type(n+2)`** - Selects all elements of the type starting from the 2nd one
**`:nth-child(3n)`** - Selects every 3rd element of the type
**`:nth-child(3n-2)`** - Selects every 3rd element of the type starting from the first one