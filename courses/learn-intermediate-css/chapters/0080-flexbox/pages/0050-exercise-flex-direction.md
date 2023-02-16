For the article with
**even** class, make
the image appear on the right
and
the text on the left side
with the help of the
`flex-direction` property:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<article>
  <img src="aliyar-dam-pollachi.jpg" alt="Aliyar Dam Pollachi">
  <p>
    A dam is a barrier that stops or restricts the flow of surface water or underground streams. Reservoirs created by dams not only suppress floods but also provide water for activities such as irrigation, human consumption, industrial use, aquaculture, and navigability.
  </p>
</article>
<article class="even">
  <img src="waterfall.jpg" alt="Waterfall">
  <p>
    A waterfall is a point in a river or stream where water flows over a vertical drop or a series of steep drops. Waterfalls also occur where meltwater drops over the edge of a tabular iceberg or ice shelf.
  </p>
</article>
</panel>
<panel language="css">
article {
  margin-bottom: 20px;
  background-color: #F1F5F9;
  display: flex;
}
p {
  padding: 20px;
}

img {
  width: 150px;
}
</panel>
</code>

<solution>
article {
  margin-bottom: 20px;
  background-color: #F1F5F9;
  display: flex;
}
p {
  padding: 20px;
}
.even {
  flex-direction: row-reverse;
}

img {
  width: 150px;
}
</solution>
</codeblock>