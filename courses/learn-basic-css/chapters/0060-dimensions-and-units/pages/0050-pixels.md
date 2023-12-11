A **pixel** represents a unit of measurement
commonly used for specifying exact sizes and
dimensions on a display.
Each pixel corresponds to a single dot on
the screen, maintaining the same physical size
regardless of screen resolution or surrounding elements.

Some other absolute units are:

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
