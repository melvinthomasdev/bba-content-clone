Make the background image repeat horizontally:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>
  Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. When coffee berries turn from green to bright red in color, they are picked, processed, and dried.
</p>
</panel>
<panel language="css">
body {
  padding: 80px;
  background-image: url('https://images.pexels.com/photos/942809/pexels-photo-942809.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=150');
}
</panel>
</code>

<solution>
body {
  padding: 80px;
  background-image: url('https://images.pexels.com/photos/942809/pexels-photo-942809.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=150');
  background-repeat: repeat-x;
}
</solution>
</codeblock>