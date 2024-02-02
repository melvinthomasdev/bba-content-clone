In this challenge, we will build a page about some popular movies.
Our page will look good on all screen sizes.

<image>movie-card.gif</image>

When it is completed, try opening it on a mobile as well as on a laptop.
It should work properly on both.

<image>movie-card-challenge.png</image>

For completing this challenge, we need to complete the following tasks:

**Body Styles**
- Set the font family for the body element to **Arial, sans-serif**.
- Set the background colour of the body to **#f5f5f5**.
- Remove the default margin and padding from the body.

**Container Styles**
- Add **auto** margins to the class **container** for centering horizontally.
- Apply a padding of **20px** to the class **container**.
- Center the text within the class **container**.
- Set the background colour of the class **container** to **#fff**.
- Apply a border-radius of **10px** to the class **container**.

**Main Heading Styles**
- Set the font size of elements with the class **main-heading** to **2rem**.
- Set the text colour of elements with the class **main-heading** to **#333**.
- Add a bottom margin of **20px** to elements with the class **main-heading**.

**Description Styles**
- Set the maximum width of elements with the class **description** to **800px**.
- Center the text within elements with the class **description**.
- Set the font size of elements with the class **description** to **1.2rem**.
- Set the text colour of elements with the class **description** to **#666**.
- Add a bottom margin of **30px**  to elements with the class **description**.

**Card Styles**
- Set the width of elements with the class **card** to **300px**.
- Set the background colour of elements with the class **card** to **#fff**.
- Apply a border-radius of **10px** to elements with the class **card**.
- Add margins of **20px** to all sides of elements with the class **card**.
- Display elements with the class **card** inline.

**Card Link Styles**

Remove the underline from links within elements with the class **card**.

**Poster Styles**
- Set the maximum width of elements with the class **poster** to **100%**.
- Set the height of elements with the class **poster** to auto.
- Apply a border-radius of **10px** to the top corners of elements with the class **poster**.

**Movie Name Styles**
- Set the font size of elements with the class **movie-name** to **1.5rem**.
- Set the text colour of elements with the class **movie-name** to **#333**.
- Apply padding of **10px** to elements with the class **movie-name**.

**Watch Option Button Styles**
- Set the background colour of elements with the class **watch-option** to **#007bff**.
- Set the text colour of elements with the class **watch-option** to **#fff**.
- Remove the border from elements with the class **watch-option**.
- Apply a border-radius of **10px** to the bottom corners of elements with the class **watch-option**.
- Apply padding of **10px** to elements with the class **watch-option**.

<codeblock language="css" type="exercise" testMode="fixedInput">
<code>
<panel language="html">
<div class="container">
  <div class="introduction">
    <h1 class="main-heading">Explore Popular Movies</h1>
    <p class="description">
      Discover a collection of popular movies with our movie card showcase. Each card
      provides
      a glimpse into the world of cinema, featuring details about the movie and options to watch. Dive into
      the
      cinematic experience now!
    </p>
  </div>
  <div class="card-list">
  <div class="card">
    <a href="https://www.imdb.com/title/tt7975244/?ref_=tt_sims_tt_t_1">
      <img class="poster" src="https://m.media-amazon.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg" alt="Movie Poster">
    </a>
    <a href="https://www.imdb.com/title/tt7975244/?ref_=tt_sims_tt_t_1">
      <p class="movie-name">Jumanji: The Next Level</p>
    </a>
    <button class="watch-option" type="button"> Watch Options </button>
  </div>
  <div class="card">
    <a href="https://www.imdb.com/title/tt7975244/?ref_=tt_sims_tt_t_1">
      <img class="poster" src="https://m.media-amazon.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg" alt="Movie Poster">
    </a>
    <a href="https://www.imdb.com/title/tt7975244/?ref_=tt_sims_tt_t_1">
      <p class="movie-name">Jumanji: The Next Level</p>
    </a>
    <button class="watch-option" type="button"> Watch Options </button>
  </div>
    <div class="card">
      <a href="https://www.imdb.com/title/tt7975244/?ref_=tt_sims_tt_t_1">
        <img class="poster" src="https://m.media-amazon.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg" alt="Movie Poster">
      </a>
      <a href="https://www.imdb.com/title/tt7975244/?ref_=tt_sims_tt_t_1">
        <p class="movie-name">Jumanji: The Next Level</p>
      </a>
      <button class="watch-option" type="button"> Watch Options </button>
    </div>
  </div>  
</div>
</panel>
<panel language="css">
/* Write code below this line */
</panel>
</code>
<solution>
/* Write code below this line */
body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  margin: 0;
  padding: 0;
}

.container {
  margin: 0 auto;
  padding: 20px;
  text-align: center;
  background-color: #fff;
  border-radius: 10px;
}

.main-heading {
  font-size: 2rem;
  color: #333;
  margin-bottom: 20px;
}

.description {
  max-width: 800px;
  text-align: center;
  margin: 0 auto;
  font-size: 1.2rem;
  color: #666;
  margin-bottom: 30px;
}

.card {
  width: 300px;
  background-color: #fff;
  border-radius: 10px;
  margin: 20px;
  display: inline-block; /* Display cards inline */
}

.card a {
  text-decoration: none; /* Remove underline from links */
}

.poster {
  max-width: 100%;
  height: auto;
  border-radius: 10px 10px 0 0;
}

.movie-name {
  font-size: 1.5rem;
  color: #333;
  padding: 10px;
}

.watch-option {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 0 0 10px 10px;
  padding: 10px;
}
</solution>
</codeblock>
