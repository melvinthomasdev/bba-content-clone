Turn the `article` element
into a **flex container**:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<article>
  <img src="https://ucarecdn.com/64bbfc5d-0ecf-41ba-a724-85bd235b47c6/" alt="Aliyar Dam Pollachi">
  <p>
    A dam is a barrier that stops or restricts the flow of surface water or underground streams. Reservoirs created by dams not only suppress floods but also provide water for activities such as irrigation, human consumption, industrial use, aquaculture, and navigability.
  </p>
</article>
</panel>
<panel language="css">
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
</codeblock>