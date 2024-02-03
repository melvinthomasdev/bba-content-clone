The background in the code editor given below
is too bright and makes it hard to read
the text.

Add a `background-color` to the paragraph
using these values:

Red - **253**, Green - **186**, Blue - **116**, Alpha - **0.8**

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <p>
    Autumn, also known as fall, is one of the four temperate seasons. Outside the tropics, autumn marks the transition from summer to winter, in September (Northern Hemisphere) or March (Southern Hemisphere), when the duration of daylight becomes noticeably shorter and the temperature cools considerably.
  </p>
</div>
</panel>
<panel language="css">
div {
  background-image: url('https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500');
}

p {
  padding: 30px;
  font-size: 1.1em;
  line-height: 1.4;
}
</panel>
</code>

<solution>
div {
  background-image: url('https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500');
}

p {
  padding: 30px;
  font-size: 1.1em;
  line-height: 1.4;
  background-color: rgba(253, 186, 116, 0.8);
}
</solution>
</codeblock>