Instead of using the individual
`top`, `right`, `bottom`
and
`left` properties,
a single `inset` property
can be used to specify all
the four values.

## Four values

If this property has
four different values
separated by spaces:

```
inset: 10px 20px 30px 40px;
```

`10px` is `top`
`20px` is `right`
`30px` is `bottom`
`40px` is `left`

Values get assigned in the clockwise direction starting from the `top`.

## Three values

```
inset: 10px 20px 30px;
```

`10px` is `top`
`20px` is `right` as well as `left`
`30px` is `bottom`

## Two values

```
inset: 10px 20px;
```

`10px` is `top` and `bottom`
`20px` is `right` and `left`

## One value

```
inset: 10px;
```

All of `top`, `bottom`,
`right` and `left` are **10px**.

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="parent">
  <div class="child" id="child1">
  </div>
</div>
<div class="parent">
  <div class="child" id="child2">
  </div>
</div>
<div class="parent">
  <div class="child" id="child3">
  </div>
</div>
<div class="parent">
  <div class="child" id="child4">
  </div>
</div>
</panel>
<panel language="css">
.parent {
  width: 100px;
  height: 100px;
  background-color: teal;
  margin-bottom: 10px;
  position: relative;
}
.child {
  position: absolute;
  background-color: orange;
}
#child1 {
  inset: 10px 20px 30px 0px;
  /* top right bottom left - clockwise direction starting from top */
}
#child2 {
  inset: 10px 20px 30px;
  /* top right&left bottom */
}
#child3 {
  inset: 10px 20px;
  /* top&bottom right&left */
}
#child4 {
  inset: 10px;
  /* all four */
}
</panel>
</code>
</codeblock>