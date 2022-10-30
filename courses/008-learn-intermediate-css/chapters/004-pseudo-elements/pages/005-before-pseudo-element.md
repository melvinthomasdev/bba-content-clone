When you want to add something
at the beginning of an element
without actually adding it in HTML,
you can use the `::before` pseudo-element
to do so, with the help of the `content` property.
You can then style that
content just like any other element:

<Editor lang="css">
<code>
<panel lang="html">
<h2>Frequently asked questions</h2>
<p class="question">
  What are FAQs?
</p>
<p class="answer">
  FAQs are frequently asked questions by customers of a product or students of a course.
</p>
</panel>
<panel lang="css">
.question::before {
  content: "Q";
}
.answer::before {
  content: "A";
}
.question::before, .answer::before {
  margin-right: 5px;
  font-size: 1.5rem;
  font-weight: bold;
  line-height: 0;
  color: tomato;
}
</panel>
</code>
</Editor>