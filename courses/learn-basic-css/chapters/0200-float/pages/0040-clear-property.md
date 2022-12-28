In the following example, we have
added another `div` after the first one.
The first `div` has an image that we floated
to the **left**. Look at what's happening:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="intro">
  <img src="aliyar-dam-pollachi.jpg" alt="Aliyar Dam Pollachi"/>
  <p>
    A dam is a barrier that stops or restricts the flow of surface water or underground streams. Reservoirs created by dams not only suppress floods but also provide water for activities such as irrigation, human consumption, industrial use, aquaculture, and navigability.
  </p>
</div>
<div id="more">
  <h2>Uses of dams</h2>
  <p>
    A dam can also be used to collect or store water which can be evenly distributed between locations. Dams generally serve the primary purpose of retaining water, while other structures such as floodgates are used to manage or prevent water flow into specific land regions. The earliest known dam is the Jawa Dam in Jordan, dating to 3,000 BC.
  </p>
</div>
</panel>
<panel language="css">
img {
  float:left;
  padding-right: 15px;
  width: 150px;
}
</panel>
</code>
</codeblock>

The second `div` starts
occupying the remaining space
around the floated element.

To prevent this from happening,
we have to use the `clear`
property on our second `div`:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="intro">
  <img src="aliyar-dam-pollachi.jpg" alt="Aliyar Dam Pollachi"/>
  <p>
    A dam is a barrier that stops or restricts the flow of surface water or underground streams. Reservoirs created by dams not only suppress floods but also provide water for activities such as irrigation, human consumption, industrial use, aquaculture, and navigability.
  </p>
</div>
<div id="more">
  <h2>Uses of dams</h2>
  <p>
    A dam can also be used to collect or store water which can be evenly distributed between locations. Dams generally serve the primary purpose of retaining water, while other structures such as floodgates are used to manage or prevent water flow into specific land regions. The earliest known dam is the Jawa Dam in Jordan, dating to 3,000 BC.
  </p>
</div>
</panel>
<panel language="css">
img {
  float:left;
  padding-right: 15px;
  width: 150px;
}
#more {
  clear: left;
}
</panel>
</code>
</codeblock>

The value of `clear` should be
similar to that of `float` specified
previously. Or you can also use
the value `both` to simply clear
both **right** as well as the **left** direction.