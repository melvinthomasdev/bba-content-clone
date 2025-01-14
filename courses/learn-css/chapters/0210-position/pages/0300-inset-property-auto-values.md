For `inset` property, you can
use the value **auto** to automatically
calculate one or more offset values.
This is helpful in a situation
where you need to specify
only two or three offsets:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div id="absolute">
</div>
</panel>
<panel language="css">
div {
  background-color: orange;
  width: 50px;
  height: 50px;
  position: absolute;
  inset: auto 10px 0 auto;
}
</panel>
</code>
</codeblock>

In the above example, the result is same as:

```
right: 10px;
bottom: 0;
```