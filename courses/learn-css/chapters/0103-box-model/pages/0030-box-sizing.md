Let us consider a situation
in which we want the HTML
element to strictly occupy
a space of **300px**.

Additionally, we want the element
to have a padding of **10px**
and a border of **1px**.

In this situation, we will have to
carefully calculate
and
subtract the width of padding
and
border from both the left as
well as right side of the element.

<image>box-sizing.png</image>

This makes the process complicated.
CSS offers an alternative to standard
box model with the property `box-sizing`.

By default, the value of this property
is `content-box`, this is the standard
CSS box model we learnt in the previous
lesson.

When we set this
to `border-box`, the alternate
model is followed.

We will learn more about the
`border-box` property in the
next lesson.
