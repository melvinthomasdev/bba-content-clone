Set `position` as `sticky`
and `top` as `0px`
for the **title** element:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<h1>Seasons</h1>
<div class="wrapper">
  <div>
    <div class="title">
      Summer
    </div>
    <div class="desc">
      Summer is the hottest of the four temperate seasons, falling after spring and before autumn. At or around the summer solstice, the earliest sunrise and latest sunset occurs, the days are longest and the nights are shortest.
    </div>
  </div>
  <div>
    <div class="title">
      Winter
    </div>
    <div class="desc">
      Winter is the coldest season of the year in polar and temperate zones; it does not occur in most of the tropical zone. It occurs after autumn and before spring in each year.
    </div>
  </div>
</div>
</panel>
<panel lang="css">
.wrapper {
  width: 300px;
  min-height: 200vh;
}
.title {
  padding: 15px;
  background-color: indigo;
  color: white;
  font-size: 1.1rem;
}
.desc {
  padding: 15px;
  font-size: 1rem;
}
</panel>
</code>

<solution>
.wrapper {
  width: 300px;
  min-height: 200vh;
}
.title {
  padding: 15px;
  background-color: indigo;
  color: white;
  font-size: 1.1rem;
  position: sticky;
  top: 0px;
}
.desc {
  padding: 15px;
  font-size: 1rem;
}
</solution>
</Editor>