In CSS, all elements are represented
as rectangular boxes in the browser.

The width and height specified for
an element in CSS are not the final
width
and
height occupied by the element
on the web page.

The actual dimensions include the
collective size of padding, borders
and
height or width.

Let us take a look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>
  Milky Way
</div>
</panel>
<panel language="css">
div {
  background-color: lightgreen;
  width: 250px;
  height: 150px;
  padding: 50px;
  border: solid 40px darkgreen;
  margin: 30px;
}
</panel>
</code>
</codeblock>

**Total width and height in the above example:**

<image>css-box-model.png</image>

From the above code, we understand
that the final width of an element
is calculated as follows:

```
Final width = content width + left padding
  + right Padding + left Border + right Border
```
<image>box-model-width-calculation.png</image>

The final height is calculated as follows:

```
Final height = content height + top padding
  + bottom Padding + top Border + bottom Border
```
<image>box-model-height-calculation.png</image>
