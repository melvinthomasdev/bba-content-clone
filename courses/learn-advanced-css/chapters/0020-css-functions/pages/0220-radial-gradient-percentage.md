Let's try to control the start and stop
values for the colours in our
radial-gradient. Here's an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: radial-gradient(red 20%, blue 40%, yellow 60%, green 100%);
}
</panel>
</code>
</codeblock>

In the above example, the gradient starts with
**red** at 20% of the radial distance,
transitions to **yellow** at 30%, and
then transitions to **green** at 40%.


<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div></div>
</panel>
<panel language="css">
div {
  height: 100vh;
	background: radial-gradient(red 0% 20%, blue 20% 40%, yellow 40% 60%, green 60% 100%);
}
</panel>
</code>
</codeblock>

In the above example, the
gradient has four color stops **red**
from 0% to 20%, **blue** from 20% to 40%,
**yellow** from 40% to 60%, and
**green** from 60% to 100%. 
The start and end percentages
for each colour stop are specified, resulting in
no mixing or overlapping of colours.
