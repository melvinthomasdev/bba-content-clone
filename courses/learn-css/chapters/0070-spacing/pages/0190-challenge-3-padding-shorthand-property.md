Apply the following padding values to the `img` elements using the `padding` shorthand property:

  1. Top padding: **25px**
  2. Right padding: **15px**
  2. Bottom padding: **20px**
  3. Left padding: **10px**

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="image-gallery">
  <img src="https://ucarecdn.com/3692f446-53a0-40ff-8819-81193d395a80/" alt="BMW">
  <img src="https://ucarecdn.com/6b9f30ee-f973-4a97-a447-6a9c2f3b05a5/" alt="Lamborghini">
  <img src="https://ucarecdn.com/2e79f4f6-bae7-4406-a83c-0a6e0ac24c58/" alt="Infinity">
  <img src="https://ucarecdn.com/99b3030a-6620-4a18-a405-954e15c85627/" alt="Mercedes Benz">
  <img src="https://ucarecdn.com/cb8a0bf8-27ab-47da-a253-5ce244f4d9c6/" alt="Isuzu D-max">
  <img src="https://ucarecdn.com/ef18da2a-8243-49f9-9cf5-f35db55d906f/" alt="Maserati">
</div>
</panel>
<panel language="css">
.image-gallery {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 10px;
}

img {
  width: 250px;
  height: auto;
  background-color: gold;
  border: 1px solid red;
  margin-bottom: 20px;
}
</panel>
</code>

<solution>
.image-gallery {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 10px;
}

img {
  width: 250px;
  height: auto;
  background-color: gold;
  border: 1px solid red;
  margin-bottom: 20px;
  padding: 25px 15px 20px 10px;
}
</solution>
</codeblock>
