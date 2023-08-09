Using the **text formatting** knowledge that you have
gained so far, do the following:

1. Make the paragraph text with id `first` 3 times that of the heading text.
**Hint:** Assume that the heading text is of size **2em**.

2. Cut out the text with id `second`.

3. Make the text with id `third` go away.

4. Make text with id `fourth` difficult to read by making the letters appear close together.
**Hint:** Reduce the space between letters by three pixels.

5. Add a cool font **Poor Story** to the text with id `fifth`, using [Google Fonts](https://fonts.google.com/specimen/Poor+Story).

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

  <p id="first">The size of this text should be 3 times that of the heading text...</p>

  <p>Cut out the <span id="second">boring</span> or <span>interesting</span> part.</p>

  <p id="third">Bad text</p>

  <p id="fourth">The ocean (also the sea or the world ocean) is the body of salt water that covers approximate 8% of the surface of Earth and contains 97% of Earth's water. An ocean can also refer to any of the large
  bodies of water into which the world ocean is conventionally divided.Separate names are used to identify
  five different areas of the ocean: Pacific (the largest), Atlantic, Indian, Southern (Antarctic), and Arctic
  (the smallest). Seawater covers approximately 361,000,000 km2 (139,000,000 sq mi) of the planet. Russian oceanographer Yuly Shokalsky to refer to the continuous ocean that covers and encircles most of Earth.
  </p>

  <p id="fifth">Steve Rogers: I can do this all day</p>
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

  <p id="first">The size of this text should be 3 times that of the heading text...</p>

  <p>Cut out the <span id="second">boring</span> or <span>interesting</span> part.</p>

  <p id="third">Bad text</p>

  <p id="fourth">The ocean (also the sea or the world ocean) is the body of salt water that covers approximate 8% of the surface of Earth and contains 97% of Earth's water. An ocean can also refer to any of the large
  bodies of water into which the world ocean is conventionally divided.Separate names are used to identify
  five different areas of the ocean: Pacific (the largest), Atlantic, Indian, Southern (Antarctic), and Arctic
  (the smallest). Seawater covers approximately 361,000,000 km2 (139,000,000 sq mi) of the planet. Russian oceanographer Yuly Shokalsky to refer to the continuous ocean that covers and encircles most of Earth.
  </p>

  <p id="fifth">Steve Rogers: I can do this all day</p>
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
  font-size: 0;
}

#fourth {
  letter-spacing: -3px;
}

#fifth {
  font-family: "Poor Story";
}
</panel>
</solution>
</codeblock>
