Using `querySelectorAll`, convert the text
inside all the paragraph elements to
😊😊😊.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<section>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
  <p>😔😔😔</p>
</section>
</panel>
<panel lang="css">
body {
  background-color: steelblue;
}
section {
  display: flex;
  font-size: 2rem;
  text-shadow: 3px 3px 0px rgba(0,0,0,0.2);
}
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let allParagraphs = document.querySelectorAll("p");
allParagraphs.forEach(para => {
  para.textContent = "😊😊😊";
});
</solution>
</Editor>