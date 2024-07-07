Change the `font-weight` for the `p`
element to **700** using the `style`
property.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>Is this text bold?</p>
</panel>
<panel language="javascript">

</panel>
</code>

<solution>
let para = document.querySelector('p');
para.style.fontWeight = 700;
</solution>
</codeblock>