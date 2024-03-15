By default, the **1rem** unit inherits the value of the font-size property as defined in the code.

In cases where no font-size is explicitly defined, the browser resorts to its default value for the font size. While the default font size is commonly set to **16px** in many modern browsers, it is important to note that this may vary depending on the browser and user settings.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<h1>Default REM Value </h1>
<div class="blue-box"></div>
<div class="red-box"></div>
</div>
</panel>
<panel language="css">
.blue-box {
  height: 2rem;
  width: 2rem;
  background-color: blue;
}

.red-box {
  height: 32px;
  width: 32px;
  background-color: red;
}
</panel>
</code>
</codeblock>

In the provided code snippet, the font-size property is not explicitly defined. Therefore, the browser's default font-size is used, which may differ across browsers and devices.

The div element with the class **blue-box** has height and width set to **2rem**, resulting in dimensions twice that of the browser's default font size.

If your browser's default font-size is **16px**, then the height and width of the div element with the class **blue-box** will be the same as the div element with the class **red-box**, where the height and width are explicitly set to **32px**.