Find out the `id` of the `section` element
and show it in the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <section id="view-point">
    <h2>Important Viewpoint</h2>
    <p>No one is above the law</p>
  </section>
</div>
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let result = document.querySelector('section');
console.log(result.id);
</solution>
</codeblock>