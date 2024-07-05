In this challenge, we will build a news article webpage.
Our article will look good on all screen sizes.
When it is completed, try opening it on a mobile
as well as on a laptop.
It should work properly on both.

<video width="700" controls>
  <source src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/Newspaper%20Challenge%20Video_1ylFlc8ie.mp4" type="video/mp4">
</video>


For completing this challenge, we need to complete the following tasks:

**Body Styles**
- Set the font family for the body element to `Georgia, 'Times New Roman', Times, serif`.
- Center the text within the body.
- Set the maximum width of the body to **800px**.
- Add auto margins to the body for centering horizontally.
- Apply a padding of **20px** to the body.
- Set the line height of the body to **1.6**.

**Main Heading Styles**
- Set the font size of elements with the class **main-heading** to **2.5rem**.
- Apply a font weight of **700** to elements with the class **main-heading**.
- Add a margin bottom of **10px** to elements with the class **main-heading**.

**Sub Heading Styles**
- Set the font size of elements with the class **sub-heading** to **1.9rem**.
- Apply a font weight of **300** to elements with the class **sub-heading**.
- Add a margin top of **10px** and a margin bottom of **10px** to elements with the class **sub-heading**.

**Image Container Styles**
- Set the maximum width of elements with the class **image-container** to **600px**.
- Add auto margins to elements with the class **image-container** for centering horizontally.

**Reference Image Styles**
- Set the width of elements with the class **reference-image** to **100%**.

**Description Paragraph Styles**
- Set the font size of paragraphs within elements with the class **description** to **1.25rem**.
- Apply a font weight of **400** to paragraphs within elements with the class **description**.
- Align the text to the left within paragraphs.
- Add a top margin of **10px** and a bottom margin of **20px** to paragraphs within elements with the class **description**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="header">
  <h1 class="main-heading">Kids Create a Neighborhood Library</h1>
  <p class="sub-heading">A Tale of Community and Discovery</p>
</div>
<div class="image-container">
  <img class="reference-image" src="https://ik.imagekit.io/d9mvewbju/Course/BigbinaryAcademy/newspaper-challenge-kids-library_njqtPqqwT.webp" alt="Children setting up a community library in a sunny park.">
</div>
<div class="description">
  <p>
    In a cozy corner of their neighborhood, a group of creative kids embarked on a heartwarming project. They wanted
    to share their favorite stories and adventures with everyone around them. So, they collected books, big and small,
    colorful and black and white, stories of magic, space adventures, undersea journeys, and tales of animals that
    could talk.</p>
  <p>
    They set up a little library in the local park, inviting anyone who wanted to explore new worlds to
    borrow a book. It wasn't just about reading; it was about bringing the community together, sharing laughs and
    learning. This tiny library on the green became a favorite spot, where kids could pick a book and dive into a
    story under the shade of a tree. They even added cozy reading nooks and started story-telling evenings. This
    simple idea sparked a love for reading across the neighborhood, proving that even the smallest acts can create the
    biggest smiles and the most imaginative journeys.
  </p>
</div>
</panel>
<panel language="css">
/* Write code below this line */
</panel>
</code>
<solution>
/* Write code below this line */
body {
  font-family: Georgia, 'Times New Roman', Times, serif;
  text-align: center;
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  line-height: 1.6;
}

.main-heading {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 10px;
}

.sub-heading {
  font-size: 1.9rem;
  font-weight: 300;
  margin-top: 10px;
  margin-bottom: 10px;
}

.image-container {
  max-width: 600px;
  margin: 0 auto;
}

.reference-image {
  width: 100%;
}

.description p {
  font-size: 1.25rem;
  font-weight: 400;
  text-align: left;
  margin-top: 10px;
  margin-bottom: 20px;
}
</solution>
</codeblock>
