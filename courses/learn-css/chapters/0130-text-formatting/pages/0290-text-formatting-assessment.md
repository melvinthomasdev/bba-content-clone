Using the **text formatting** knowledge that you have
gained so far, do the following:

1. Make the paragraph text with id `first` 3 times that of the heading text.
   **Hint:** Assume that the heading text is of size **2em**.

2. Add a strikethrough for the element with id `second`.

3. Make the text in the element with id `third` difficult to read by making the letters appear close together.
   **Hint:** Reduce the space between letters by three pixels.
4. Add a cool font **Poor Story** to the text with id `fourth`, using [Google Fonts](https://fonts.google.com/specimen/Poor+Story).

<codeblock language="css" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
</head>
<body>
  <h1>Heading Text</h1>

{" "}
<p id="first">
  The size of this text should be 3 times that of the heading text...
</p>

{" "}
<p>
  Cut out the <span id="second">boring</span> or <span>interesting</span> part.
</p>

{" "}
<p id="third">
  The ocean (also the sea or the world ocean) is the body of salt water that
  covers approximate 8% of the surface of Earth and contains 97% of Earth's
  water. An ocean can also refer to any of the large bodies of water into which
  the world ocean is conventionally divided.Separate names are used to identify
  five different areas of the ocean: Pacific (the largest), Atlantic, Indian,
  Southern (Antarctic), and Arctic(the smallest). Seawater covers approximately
  361,000,000 km2 (139,000,000 sq mi) of the planet. Russian oceanographer Yuly
  Shokalsky to refer to the continuous ocean that covers and encircles most of
  Earth.
</p>

  <p id="fourth">Steve Rogers: I can do this all day</p>
</body>
</panel>
<panel language="css">
/* Write your code here */
</panel>
</code>
<solution>
<panel language="html">
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
</head>
<body>
  <h1>Heading Text</h1>

{" "}
<p id="first">
  The size of this text should be 3 times that of the heading text...
</p>

{" "}
<p>
  Cut out the <span id="second">boring</span> or <span>interesting</span> part.
</p>

{" "}
<p id="third">
  The ocean (also the sea or the world ocean) is the body of salt water that
  covers approximate 8% of the surface of Earth and contains 97% of Earth's
  water. An ocean can also refer to any of the large bodies of water into which
  the world ocean is conventionally divided.Separate names are used to identify
  five different areas of the ocean: Pacific (the largest), Atlantic, Indian,
  Southern (Antarctic), and Arctic(the smallest). Seawater covers approximately
  361,000,000 km2 (139,000,000 sq mi) of the planet. Russian oceanographer Yuly
  Shokalsky to refer to the continuous ocean that covers and encircles most of
  Earth.
</p>

  <p id="fourth">Steve Rogers: I can do this all day</p>
</body>
</panel>
<panel language="css">
#first {
  font-size: 6em;
}

#second {
text-decoration: line-through;
}

#third {
letter-spacing: -3px;
}

#fourth {
font-family: "Poor Story";
}

</panel>
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
