Change the `font-weight` for the `p`
element to **700** using the `style`
property.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<p>Is this text bold?</p>
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let para = document.querySelector('p');
para.style.fontWeight = 700;
</solution>
</Editor>