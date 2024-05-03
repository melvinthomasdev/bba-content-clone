Use class selector and find all paragraphs with class name **large**.
Then set the `font-size` of the selected paragraphs to `24px`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p class="large">
  First paragraph. Make me 24px.
</p>
<p class="large">
  I am second paragraph. Make me 24px too.
</p>
<p>
  Third paragraph. Don't change me.
</p>
</panel>
<panel language="css">

</panel>
</code>

<solution>
.large {
  font-size: 24px;
}
</solution>
</codeblock>