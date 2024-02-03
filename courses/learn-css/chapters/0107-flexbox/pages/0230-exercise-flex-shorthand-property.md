Set `flex-grow` as **1**,
`flex-shrink` as **1**
and
`flex-basis` as **0%** for
the elements with **item**
class, using the `flex` property:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="item">
    <h2>
      Summer
    </h2>
    <p>
      Summer is the hottest of the four temperate seasons, falling after spring and before autumn. At or around the summer solstice, the earliest sunrise and latest sunset occurs.
    </p>
  </div>
  <div class="item">
    <h2>
      Winter
    </h2>
    <p>
      Winter is the coldest season of the year in polar and temperate zones; it does not occur in most of the tropical zone. It occurs after autumn and before spring in each year. Winter is caused by the axis of the Earth in that hemisphere being oriented away from the Sun.
    </p>
  </div>
  <div class="item">
    <h2>
      Autumn
    </h2>
    <p>
      Autumn, also known as fall in North American English,[1] is one of the four temperate seasons. Outside the tropics, autumn marks the transition from summer to winter, in September (Northern Hemisphere) or March (Southern Hemisphere), when the duration of daylight becomes noticeably shorter and the temperature cools considerably.
    </p>
  </div>
</div>
</panel>
<panel language="css">
.container {
  display: flex;
}
.item {
  padding: 20px;
  border: 1px solid #e6e6e6;
  margin: 5px;
}
</panel>
</code>

<solution>
.container {
  display: flex;
}
.item {
  padding: 20px;
  border: 1px solid #e6e6e6;
  margin: 5px;
  flex: 1 1 0%;
}
</solution>
</codeblock>