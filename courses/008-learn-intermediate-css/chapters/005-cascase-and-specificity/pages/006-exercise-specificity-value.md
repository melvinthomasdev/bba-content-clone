Calculate the specificity
values of both the selector
combinations in the CSS
editor given below.

Then, add
the rule `color: green` to
the lesser specific selector
and the rule `color: purple`
to the more specific selector:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<nav class="menu">
  <ul>
    <li id="item1">Item 1</li>
    <li>Item 2</li>
  </ul>
</nav>
</panel>
<panel lang="css">
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
</Editor>