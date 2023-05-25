Add the CSS reset in the code given below
using this link:
https://meyerweb.com/eric/tools/css/reset/

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<article>
  <img src="aliyar-dam-pollachi.jpg" alt="Aliyar Dam Pollachi"/>
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
/* http://meyerweb.com/eric/tools/css/reset/
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

	
article {
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