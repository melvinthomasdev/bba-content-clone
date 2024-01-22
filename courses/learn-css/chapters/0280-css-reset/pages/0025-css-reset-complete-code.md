
A **CSS reset** is
CSS code that we can put at
the top of our own code. The CSS reset code
will neutralize any code that the browser wants
to add to our webpages. There are some popular
CSS Reset stylesheets that you can choose from:
- [Eric Meyer's CSS Reset](https://meyerweb.com/eric/tools/css/reset/)
- [HTML5 Doctor CSS Reset](http://html5doctor.com/html-5-reset-stylesheet/)

In the example given below, we 
show how to use Eric Meyer's 
CSS Reset in your code: 

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<section>
  <h2>Too much to achieve!</h2>
  <p>Are we aiming for more and achieving way too less?</p>
</section>
</panel>
<panel language="css">

/* CSS Reset code */

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

/* Our custom code */

h2 {
    color: tomato;
    font-weight: 700;
}

p {
    color: darkgray;
}

</panel>
</code>
</codeblock>

