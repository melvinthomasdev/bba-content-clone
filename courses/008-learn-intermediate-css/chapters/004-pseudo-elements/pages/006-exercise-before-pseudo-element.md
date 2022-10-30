Add the content **NOTE:**
before elements with the **note**
class:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<p>
  This is a regular paragraph with some text.
</p>
<p class="note">
  This is an important note.
</p>
</panel>
<panel lang="css">
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
</Editor>