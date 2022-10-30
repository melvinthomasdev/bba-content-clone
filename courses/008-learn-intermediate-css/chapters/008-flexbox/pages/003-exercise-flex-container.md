Turn the `article` element
into a **flex container**:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<article>
  <img src="aiyar-dam-pollachi.jpg" alt="Aiyar Dam Pollachi"/>
  <p>
    A dam is a barrier that stops or restricts the flow of surface water or underground streams. Reservoirs created by dams not only suppress floods but also provide water for activities such as irrigation, human consumption, industrial use, aquaculture, and navigability.
  </p>
</article>
</panel>
<panel lang="css">
article {
  background-color: #F1F5F9;
}

p {
  padding: 20px;
}

img {
  width: 200px;
}
</panel>
</code>

<solution>
article {
  display: flex;
  background-color: #F1F5F9;
}

p {
  padding: 20px;
}

img {
  width: 200px;
}
</solution>
</Editor>