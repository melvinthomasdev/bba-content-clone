When we need to select any
sibling element that follow
a particular element, we use
the `~` character to combine
two selectors like this:

```
h1 ~ p
```

`h1 ~ p` will select
all the `p` elements that come
*after* an `h1` element
within the same
parent element.
This will select all descendant `p`
elements too.
The `p` element should be after the
`h1` element and should be a direct child or a
descendant of the parent of the `h1` element:

<Editor lang="css">
<code>
<panel lang="html">
<div>
    <p>
    Source: Wikipedia
    </p>
    <h1>Lotus</h1>
    <span>Binomial name: Nelumbo nucifera</span>
    <p>
    Lotus plants are adapted to grow in the flood plains of slow-moving rivers and delta areas. Stands of lotus drop hundreds of thousands of seeds every year to the bottom of the pond.
    </p>
    <p>
    While some sprout immediately, and most are eaten by wildlife, the remaining seeds can remain dormant for an extensive period of time as the pond silts in and dries out.
    <p>Test</p>
    </p>
</div>
<p>More flowers coming soon</p>
</panel>
<panel lang="css">
h1 ~ p {
  color: brown;
}
</panel>
</code>
</Editor>

The first `p` element is not
selected because it does not
come *after* `h1`. And the last
`p` element is not selected
because it is not within
the same parent element as `h1`.