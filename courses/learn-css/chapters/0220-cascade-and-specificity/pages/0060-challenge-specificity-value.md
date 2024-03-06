Calculate the specificity
values of both the selector
combinations in the CSS
editor given below.

Then, add
the rule `color: green` to
the lesser specific selector
and the rule `color: purple`
to the more specific selector:

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<nav class="menu">
  <ul>
    <li id="item1">Item 1</li>
    <li>Item 2</li>
  </ul>
</nav>
</panel>
<panel language="css">
#item1 {

}
.menu > ul > li {

}
</panel>
</code>

<solution>
#item1 {
  color: purple;
}
.menu > ul > li {
  color: green;
}
</solution>
</codeblock>