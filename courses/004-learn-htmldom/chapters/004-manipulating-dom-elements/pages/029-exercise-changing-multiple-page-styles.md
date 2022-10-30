Change the `font-size` for the `p`
element to **32px**, the `font-weight` to
**700**, and the `text-decoration`
to **overline** using the `style.cssText`
property.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<p>This text will be tall & with a roof over its head.</p>
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let para = document.querySelector('p');
para.style.cssText = "font-size: 32px; font-weight: 700; text-decoration: overline";
</solution>
</Editor>