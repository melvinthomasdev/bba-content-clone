**Serif** and **sans serif** are generic fonts.
If we need to display the text in a specific font,
we have to instead use actual font names
such as `Arial` or `Times New Roman`.

However, not all fonts are available on all browsers.
So, we need to specify fallbacks.
We can provide as many fallback
choices as we need separated by commas
in the `font-family` property.
The first available font in the
browser gets used.


<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h2>
  This heading is in Times New Roman
</h2>
<p id="first">
  'Open Sans' is not available in the browser. Hence the fallback 'sans-serif' font family is used.
</p>
<p id="second">
  'Roboto' is not available, hence the next option 'Trebuchet MS' is used.
</p>
</panel>
<panel language="css">
h2 {
  font-family: 'Times New Roman', serif;
}
#first {
  font-family: 'Open Sans', sans-serif;
}
#second {
  font-family: 'Roboto', 'Trebuchet MS', sans-serif;
}
</panel>
</code>
</codeblock>

Since, generic font families
are available on all browsers,
it's a smart choice to include
one as a fallback. Just remember
to make it the last one in the
list.