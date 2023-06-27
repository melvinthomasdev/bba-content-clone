When we use absolute units to specify a length,
the size is fixed and does not depend on the size of other elements.

Some absolute units are:

- Pixels, `px`
- Centimeters, `cm`
- Inches, `in`

Look at the code given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="inches">
  <div id="centi">
    <div id="pixels">
    </div>
  </div>
</div>
</panel>
<panel language="css">
#inches {
  width: 2in;
  height: 2.5in;
  background-color: tomato;
}
#centi {
  width: 4cm;
  height: 4cm;
  background-color: orange;
}
#pixels {
  width: 100px;
  height: 50px;
  background-color: teal;
}
</panel>
</code>
</codeblock>

The size of these elements do not change when you change their font size or parent element's size.