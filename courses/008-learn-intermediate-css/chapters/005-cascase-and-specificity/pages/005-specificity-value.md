We just saw that ID
selectors are more specific
than class selectors, which are
in turn more specific than
element selectors. But what
about combination of selectors
like `#div1 p` or `.menu > ul > li`?

There is a **specificity value**
attached to each of the selectors
or combination of selectors.
Higher the specificity value,
more specific is the selector.
Let's see how this value
is calculated:

You need to start with 0.
Add 1 for each element selector,
10 for each class selector
and
100 for each ID selector.
Consider the following
combination of selectors:

```
#menu .nav > ul > li
```

`#menu` - ID Selector: Value - **100** <br>
`.nav` - Class Selector: Value - **10** <br>
`ul` - Element Selector: Value - **1** <br>
`li` - Element Selector: Value - **1** <br>

So, the specificity value of this
selector is `100 + 10 + 1 + 1` = **`112`**

Let's consider two selectors -
`div .para .sp` and `#p1 > span`
referring to the same HTML
element in the example given below:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <p class="para" id="p1">
    This is a paragraph with a <span class="sp">span</span> element
  </p>
</div>
</panel>
<panel lang="css">
div .para .sp {
  color: blue;
}
#p1 > span {
  color: orange;
}
</panel>
</code>
</Editor>

Looking at the output,
we know that `#p1 > span`
is more specific, but let
us calculate the specificity
values of both to confirm the same:

```
div .para .sp
```
Specificity value = 1 + 10 + 10 = **21**

```
#p1 > span
```
Specificity value = 100 + 1 = **101**

Now we know, why the
orange color was applied
to the `span`.