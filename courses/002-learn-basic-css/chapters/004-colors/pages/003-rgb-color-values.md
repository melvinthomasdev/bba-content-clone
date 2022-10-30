With **color names**, you can only choose from the 140 ones given here: [color names](https://www.w3schools.com/cssref/css_colors.asp). For styling, we need more freedom.

To get a specific colour, we can mix the 3 primary colours `Red`, `Green` and `Blue` in different proportions. This way, we can create any colour that we require.

<!-- **RGB Syntax: `rgb(red, green, blue)`**

**Example: `rgb(255, 165, 0)`** -->

For example, look at the code given below:

<Editor lang="css">
<code>
<panel lang="html">
<h1>
  Web Design
</h1>
<p id="one">
  Web design encompasses many different skills and disciplines in the production and maintenance of websites.
</p>
<p id="two">
  The different areas of web design include web graphic design; user interface design (UI design); authoring, including standardised code and proprietary software; user experience design (UX design); and search engine optimization.
</p>
</panel>
<panel lang="css">
h1 {
  /* Orange */
  color: rgb(255, 165, 0);
}
#one {
  /* Gray */
  color: rgb(128, 128, 128);
}
#two {
  /* Black background */
  background-color: rgb(0, 0, 0);
  /* White text */
  color: rgb(255, 255, 255);
}
</panel>
</code>
</Editor>

The `h1` has a text color of **Orange** because we mixed red with an intensity of 255, green with an intensity of 165 and blue with an intensity of 0.

The `p` element with `id` **one** has text color gray because in the rgb code, we have all three colors with an intensity of 128.

Each parameter takes a value ranging from **0** to **255**, `0` being least intensity and `255` being highest intensity.
