Prevent the image from
shrinking, when the output
panel is resized:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<article>
  <div class="image">
    <img src="https://images.pexels.com/photos/1171581/pexels-photo-1171581.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=80" />
  </div>
  <p>
    Lotus is often colloquially called a water lily. Lotus plants are adapted to grow in the flood plains of slow-moving rivers and delta areas. Stands of lotus drop hundreds of thousands of seeds every year to the bottom of the pond.
  </p>
</article>
</panel>
<panel lang="css">
article {
  display: flex;
  align-items: center;
}
img {
  width: 100%;
}
p {
  padding-left: 20px;
}
</panel>
</code>

<solution>
article {
  display: flex;
  align-items: center;
}
img {
  width: 100%;
}
p {
  padding-left: 20px;
}
.image {
  flex-shrink: 0;
}
</solution>
</Editor>