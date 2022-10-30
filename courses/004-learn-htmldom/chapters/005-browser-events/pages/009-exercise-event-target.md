In the example given below,
add an event listener to the
`section` element. It should be so
that when we hover over any element
inside the `section`, the text in the
`div` should tell us the tag name of
that element.

<Editor lang="javascript" type="exercise">
<code>
<panel lang="html">
<section>
  <div>Element Name</div>
  <h2>Coding <span>❤️</span></h2>
  <p>There are many languages out there, each with its own proponents: </p>
  <ul>
    <li>JavaScript</li>
    <li>Ruby</li>
    <li>Python</li>
  </ul>
  <a href="#">This link doesn't go anywhere.</a>
</section>
</panel>
<panel lang="css">
section {
  font-family: Helvetica;
}

div {
  background-color: goldenrod;
  display: inline-block;
  font-weight: 700;
  color: snow;
  padding: 0.2rem 0.5rem;
  border-radius: 0.3rem;
}
</panel>
<panel lang="javascript">

</panel>
</code>

<solution>
let favLanguage = document.querySelector("section");
let elem = document.querySelector("div");
favLanguage.addEventListener("mouseover", (event) => {
  elem.textContent = event.target.tagName;
});
</solution>

<domtestevents>
<event>
document.querySelector('section').dispatchEvent(new MouseEvent('mouseover', {}));
</event>
</domtestevents>
</Editor>