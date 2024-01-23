In this challenge, we will build a news article webpage.
Our article will look good on all screen sizes.
When it is completed, try opening it on a mobile
as well as on a laptop.
It should work properly on both.

<image>newspaper-challenge.gif</image>

For completing this challenge,
we need to complete the following tasks:
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
  <h1 class="main-heading">Astonishing Discovery: Flying Trains to Revolutionize Travel!</h1>
  <p class="sub-heading">Scientists Unveil the Future of Transportation</p>
</div>
<div class="image-container">
  <img class="reference-image" src="https://ucarecdn.com/de3ec0c8-0efb-4409-86d1-62cc145eed37/" alt="flying trains">
</div>
<div class="description">
  <p>
    In a groundbreaking announcement, scientists from the renowned Institute of Futuristic Travel have revealed their
    latest invention: Flying Trains! Yes, you read that correctly—trains that can fly through the skies!

    Imagine the convenience of boarding a train in your city and soaring above the clouds to your destination. No more
    traffic jams or long airport queues. Flying Trains will whisk you away to your chosen city in no time.

    The technology behind this marvel is top secret, but insiders say it involves a blend of anti-gravity propulsion
    and
    advanced aerodynamics. These trains are expected to reach speeds of up to 1000 miles per hour!

    "It's a game-changer for travel enthusiasts," says Dr. Amelia Jetson, the lead scientist behind the project.
    "We've
    combined the reliability of trains with the speed of airplanes to create a seamless travel experience."

    The first Flying Train route is set to connect New York and Los Angeles, promising passengers a breathtaking
    journey
    across the United States in just a few hours. Tickets are already selling like hotcakes!

    But the excitement doesn't stop there. Plans are underway to introduce luxurious onboard amenities, including sky
    lounges, gourmet dining, and panoramic windows for stunning aerial views.

    Critics are calling it "science fiction come to life," but Dr. Jetson assures us that Flying Trains are very real
    and will soon transform the way we travel.

    Get ready to take to the skies in style with the future of transportation—Flying Trains!
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
