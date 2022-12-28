Add the content **NOTE:**
before elements with the **note**
class:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>
  This is a regular paragraph with some text.
</p>
<p class="note">
  This is an important note.
</p>
</panel>
<panel language="css">
.note {
  font-weight: bold;
}
</panel>
</code>

<solution>
.note {
  font-weight: bold;
}
.note::before {
  content: "NOTE:";
}
</solution>
</codeblock>