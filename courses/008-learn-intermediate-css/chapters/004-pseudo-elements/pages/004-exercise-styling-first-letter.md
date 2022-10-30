Style only the first letter of
this paragraph with `font-size`
of **2rem**, `font-family` of **cursive**
and `line-height` of **1**:

<Editor lang="css" type="exercise">
<code>
<panel lang="html">
<p>
  Niagara Falls is a group of three waterfalls at the southern end of Niagara Gorge, spanning the border between the province of Ontario in Canada and the state of New York in the United States. The largest of the three is Horseshoe Falls, also known as Canadian Falls, which straddles the international border of the two countries.
</p>
</panel>
<panel lang="css">
p {
  line-height: 1.4;
}
</panel>
</code>

<solution>
p {
  line-height: 1.4;
}
p::first-letter {
  font-size: 2rem;
  font-family: cursive;
  line-height: 1;
}
</solution>
</Editor>