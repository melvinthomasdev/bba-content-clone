In the code given below,
select the images which are
not inside a `div` element and
give them a border of `5px solid
orangered`.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div>
  <img src="munnar-kerala-01.jpg" alt="Munnar, Kerala">
</div>

<div>
  <img src="munnar-kerala-02.jpg" alt="Munnar, Kerala">
</div>

<img src="munnar-kerala-03.jpg" alt="Munnar, Kerala">

<div>
  <img src="munnar-kerala-04.jpg" alt="Munnar, Kerala">
</div>
</panel>
<panel language="css">
img {
  width: 100px;
  border: 5px solid midnightblue;
  margin:20px;
}

div{
  display:inline-block;
}
</panel>
</code>

<solution>
img {
  width: 100px;
  border: 5px solid midnightblue;
  margin:20px;
}

div{
  display:inline-block;
}

img:not(div>img){
  border:5px solid orangered;
}
</solution>
</codeblock>