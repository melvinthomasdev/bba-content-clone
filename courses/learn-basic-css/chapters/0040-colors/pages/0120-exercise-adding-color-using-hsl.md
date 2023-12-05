Add font color with `hsl` 
value of light blue -
`hsl(195, 53%, 79%)`,
to the HTML elements with
class `.precious-stone`:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<h2>Cartoon Characters</h2>
<p class="precious-stone">Sapphire</p>
<p class="precious-stone">Ruby</p>
<p class="precious-stone">Gem</p>
<p class="precious-stone">Diamond</p>
</panel>
<panel language="css">
* {
  text-align: center
}
/* Write code below this line */
</panel>
</code>
<solution>
* {
  text-align: center
}
/* Write code below this line */
.precious-stone {
  color: hsl(195, 53%, 79%);
}
</solution>
</codeblock>
