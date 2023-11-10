The `hsla` function is similar
to the `hsl` function, but it includes
an additional parameter called **alpha**,
which represents the level of transparency.

```css
hsla(hue, saturation, lightness, alpha)
```

Let's look at an example:

<codeblock language="css" type="lesson">
<code>
<panel language="html">
<div class="box"></div>
</panel>
<panel language="css">
.box{
  height: 150px;
  width: 200px;
  margin: 50px auto;
  background-color: hsla(0, 100%, 50%, 0.5);
}
</panel>
</code>
</codeblock>

The value of alpha can be between 0 and 1.
Where, 0 means completely transparent
and 1 means completely opaque.

Refer **Opacity** lesson in
[Learn Basic CSS](https://courses.bigbinaryacademy.com/learn-basic-css/) for more.
