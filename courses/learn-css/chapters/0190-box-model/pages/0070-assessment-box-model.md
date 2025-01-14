Using the CSS **Box model** knowledge that you have
gained so far, do the following:

1. Add a padding value of `20px` to **Honda City**.

2. Add a solid `goldenrod` border of `3px` to **Skoda Slavia**.

3. Set the `box-sizing` to `border-box` for all elements with a single line of CSS code.

<codeblock language="css" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div class="card__parent">
  <div class="card honda_city">
    <h2 class="card_name">Honda City</h2>
    <img class="card_img" src="https://carsguide-res.cloudinary.com/image/upload/f_auto,fl_lossy,q_auto,t_default/v1/editorial/vhs/Honda-City.png" />
    <p class="card_details">The Honda City is smartly styled with dignified stature and superior technological prowess. A wide, upper-grill in the front presents the signature Honda Solid Wing Face, and elevates the car to a position of prominence.</p>
  </div>

  <div class="card skoda_slavia">
    <h2 class="card_name">Skoda Slavia</h2>
    <img class="card_img" src="https://kunskoda.com/assets/front/images/slavia/1.png" />
    <p class="card_details">Skoda Slavia is a 5 seater Sedan available in a price range of ₹ 10.99 - 18.39 Lakh. It is available in 8 variants.</p>
  </div>
</div>
</panel>
<panel language="css">
.card__parent {
  display: flex;
  gap: 1rem;
}

.card_name {
font-size: 32px;
font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
}

.card_img {
width: 100%;
}

.card_details {
text-align: left;
}

.card {
width: 300px;
padding: 16px;
min-height: 400px;
border-radius: 10px;
text-align: center;
box-shadow: 0px 0px 4px gray;
}

.honda_city {
background-color: peachpuff;
/_ Add padding property here _/

}

.skoda_slavia {
background-color: blanchedalmond;
/_ Add border property here _/

}

</panel>
</code>

<solution>
.card__parent {
  display: flex;
  gap: 1rem;
}

.card_name {
font-size: 32px;
font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
}

.card_img {
width: 100%;
}

.card_details {
text-align: left;
}

.card {
width: 300px;
padding: 16px;
min-height: 400px;
border-radius: 10px;
text-align: center;
box-shadow: 0px 0px 4px gray;
}

.honda_city {
background-color: peachpuff;
/_ Add padding property here _/
padding: 20px;
}

.skoda_slavia {
background-color: blanchedalmond;
/_ Add border property here _/
border: 3px solid goldenrod;
}

- {
  box-sizing: border-box;
  }
  </solution>
</codeblock>

We are not displaying the answer for this challenge.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2kj86untg-wCGh2GPBA2I3iWZk4ke~tg) to join the community.
