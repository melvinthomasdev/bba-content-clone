We can use the `clear` property
on the next element to clear
the effect of the `float` property.
However, we still have a problem.
If the floating element is taller
than its parent, it overflows
the parent's boundaries.
Look at the example given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div>

  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/aliyar-dam-pollachi_plFB33l2XF.jpg" alt="Aliyar Dam Pollachi">
  <p>
    A dam is a barrier that stops or restricts the flow of surface water or underground streams. Reservoirs created by dams not only suppress floods but also provide water for activities such as irrigation, human consumption, industrial use, aquaculture, and navigability.
  </p>

</div>
</panel>
<panel language="css">
img {
  float:left;
  padding-right: 15px;
  width: 150px;
}
div {
  background-color: lightgreen;
  padding: 15px;
}
</panel>
</code>
</codeblock>

There are many ways to solve this problem.
However, the most common method used is
to add a class **clearfix** to the parent
of the floating element and define the
following properties using
`::after`:

```
.clearfix::after {
  content: "";
  clear: both;
  display: block;
}
```

Look at the solution given below:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="clearfix">
  <img src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/aliyar-dam-pollachi_plFB33l2XF.jpg" alt="Aliyar Dam Pollachi">
  <p>
    A dam is a barrier that stops or restricts the flow of surface water or underground streams. Reservoirs created by dams not only suppress floods but also provide water for activities such as irrigation, human consumption, industrial use, aquaculture, and navigability.
  </p>
</div>
</panel>
<panel language="css">
img {
  float:left;
  padding-right: 15px;
  width: 150px;
}
div {
  background-color: lightgreen;
  padding: 15px;
}
.clearfix::after {
  content: "";
  clear: both;
  display: block;
}
</panel>
</code>
</codeblock>

In this case, we don't have
to use `clear` on the next
element. We'll
learn about `::after`
in an upcoming lesson.
