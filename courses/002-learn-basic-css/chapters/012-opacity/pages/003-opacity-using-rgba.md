When we set the `opacity` for a parent element,
all the child elements also inherit the same value:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <h1>Autumn</h1>
  <p>
    Autumn, also known as fall, is one of the four temperate seasons. Outside the tropics, autumn marks the transition from summer to winter, in September (Northern Hemisphere) or March (Southern Hemisphere), when the duration of daylight becomes noticeably shorter and the temperature cools considerably.
  </p>
</div>
</panel>
<panel lang="css">
div {
  margin: 20px;
  padding: 30px;
  background-color: rgb(253,186,116);
  opacity: 0.5;
}
</panel>
</code>
</Editor>

Opacity of the div is set to `0.5`,
but the child elements `h1` and `p` also become semi-transparent.
This makes it hard to read the text.

If we want the opacity to apply only to the background,
we can specify the background color value using `rgba` instead of using `rgb`.

```
rgba(red, green, blue, alpha)
```

The `alpha` parameter sets the opacity.
It takes in any value
ranging from `0.0` to `1.0`:


<Editor lang="css">
<code>
<panel lang="html">
<div>
  <h1>Autumn</h1>
  <p>
    Autumn, also known as fall, is one of the four temperate seasons. Outside the tropics, autumn marks the transition from summer to winter, in September (Northern Hemisphere) or March (Southern Hemisphere), when the duration of daylight becomes noticeably shorter and the temperature cools considerably.
  </p>
</div>
</panel>
<panel lang="css">
div {
  margin: 20px;
  padding: 30px;
  background-color: rgba(253,186,116,0.5);
}
</panel>
</code>
</Editor>