In the example given below,
select the three span elements
using their ids. Then store the values
in the variables **firstCompliment**,
**secondCompliment** and **thirdCompliment**
respectively.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<p>The success of this venture depended on your <span id="first-compliment">timely</span>, <span id="second-compliment">judicious</span>, and <span id="third-compliment">justified</span> actions.</p>
</panel>
<panel language="javascript">
let firstCompliment = ;
let secondCompliment = ;
let thirdCompliment = ;

/*
  The code below this line will make sense as you study more in the course.
  Right now, simply focus on selecting the element.
*/

firstCompliment.style.cssText = "color: tomato; font-weight: 700; text-decoration: line-through; text-transform: capitalize";
secondCompliment.style.cssText = "color: gold; font-weight: 700; text-decoration: overline";
thirdCompliment.style.cssText = "color: teal; font-weight: 700; text-transform: uppercase; text-decoration: underline";
</panel>
</code>

<solution>
let firstCompliment = document.getElementById("first-compliment");
let secondCompliment = document.getElementById("second-compliment");
let thirdCompliment = document.getElementById("third-compliment");

firstCompliment.style.cssText = "color: tomato; font-weight: 700; text-decoration: line-through; text-transform: capitalize";
secondCompliment.style.cssText = "color: gold; font-weight: 700; text-decoration: overline";
thirdCompliment.style.cssText = "color: teal; font-weight: 700; text-transform: uppercase; text-decoration: underline";
</solution>
</codeblock>