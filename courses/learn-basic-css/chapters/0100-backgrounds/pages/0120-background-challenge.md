Using the CSS **background** knowledge that you have
gained so far, write CSS to do the following:

1. Add a background image https://upload.wikimedia.org/wikipedia/commons/f/fc/TheMatrixAnimated.gif.

2. Stop the crazy repeating background images.

3. Now, let's make the background color match that of the image.

4. Let's center the background image.

5. Let's increase the size of the background image to 50%.

<codeblock language="css" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<div class="container">
</div>
</panel>
<panel language="css">
.container {
  min-height: 90vh;
  /* Write your code here */

}
</panel>
</code>
<solution>
<panel language="html">
<div class="container">
</div>
</panel>
<panel language="css">
.container {
  min-height: 90vh;
  /* write your code here */
  background-image: url('https://upload.wikimedia.org/wikipedia/commons/f/fc/TheMatrixAnimated.gif');
  background-repeat: no-repeat;
  background-color: black;
  background-position: center center;
  background-size: 50%;
}
</panel>
</solution>
</codeblock>

We do not display answers in this exercise.
We do this because we want students to challenge
themselves and not give in to the temptation of taking
a peek at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.
Here's the link to join: **[Link](https://bigbinaryacademy.slack.com/join/shared_invite/zt-23dvxwolx-U9LYYbv4ycmODEA1cbNFgA#/shared-invite/email)**.
