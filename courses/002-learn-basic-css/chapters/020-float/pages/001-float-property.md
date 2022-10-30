We can use the `float` property to
put an element on the *right* or *left*
side inside its parent element. This takes the
element out of the normal page structure
and the other elements can
wrap around it:

<Editor lang="css">
<code>
<panel lang="html">
<div>
  <img src="har-ki-doon-valley-uttarakhand.jpg" alt="Har ki Doon Valley Uttarakhand"/>
  <h1>Har Ki Doon</h2>
  <p>
    Har Ki Doon or Har Ki Dun is a cradle-shaped hanging valley in the Garhwal Himalayas of Uttarakhand, India. The region is surrounded with green Bugyals (High Altitude Meadows). It is surrounded by snow-covered peaks and alpine vegetation. It is connected to Baspa Valley by the Borasu Pass. (Credits: Wikipedia)
  </p>
</div>
</panel>
<panel lang="css">
img {
  float:left;
  padding-right: 15px;
  width: 250px;
}
</panel>
</code>
</Editor>

The commonly used values for this property are:

- `left`

- `right`

- `none`

In the above editor, try changing
the value of `float` to `right`
and
notice how the image gets placed at
the right side inside the parent `div`.
This makes the `h1` and the `p` element
shift to the left.

If we set the `float` rule's value
to `none`, you'll
see how the image and
other elements simply follow the
normal flow.