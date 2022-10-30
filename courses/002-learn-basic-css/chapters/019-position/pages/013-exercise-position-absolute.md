Add `absolute` position to the `a` element and set the `right` and `bottom` values to `20px` to make the link appear at the right bottom corner of the card. Remember to add `position:relative` to the parent:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<div class="card">
  <h1>Monsoon</h1>
  <p>
    A monsoon is traditionally a seasonal reversing wind accompanied by corresponding changes in precipitation, but is now used to describe...
  </p>
  <a href="#">Read More >></a>
</div>
</panel>
<panel lang="css">
.card {
  width: 400px;
  height: 200px;
  padding: 20px;
  background-color: #CCFBF1;
}
</panel>
</code>

<solution>
.card {
  width: 400px;
  height: 200px;
  padding: 20px;
  background-color: #CCFBF1;
  position: relative;
}
a {
  position: absolute;
  right: 20px;
  bottom: 20px;
}
</solution>
</Editor>