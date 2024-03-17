Using the HTML DOM knowledge you have gained so far,
add a **third** movie to the list of favourite movies.

The movie **title**, **description**, and
the poster image **URL** are already provided
in the code block.

You need to perform the following tasks:

- Create an `li` element and assign it to a variable `newMovie`.
- Add the class `movie` to this `li` element.
- Create an `img` element and assign it to a variable `poster`.
- Use the provided `imageUrl` and `title` as image source and alt text.
- Create an `h2` element and assign it to a variable `movieTitle`.
- Set the innerText of this element to the value of the `title` variable.
- Create an `p` element and assign it to a variable `movieDescription`.
- Set the innerText of this element to the value of the `description` variable.
- Append `poster`, `movieTitle` and `movieDescription` to `newMovie`.
- Select the `ul` element and assign it to a variable `movieList`.
- Finally, append the `newMovie` to `movieList`.

<image>movie-list-ex.png</image>

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
<panel language="html">
<header>
  <h1>My Favourite Movies</h1>
</header>
<main>
  <ul class="movie-list">
    <li class="movie">
      <img src="https://upload.wikimedia.org/wikipedia/en/f/f6/Gravity_Poster.jpg" alt="Gravity">
      <h2>Gravity</h2>
      <p>On an outer space mission, engineer Ryan Stone and astronaut Matt Kowalski are hit by high-speed space debris. As the situation gets dire, Stone rises to the occasion as a survivor.</p>
    </li>
    <li class="movie">
      <img src="https://upload.wikimedia.org/wikipedia/en/4/4d/Avengers_Infinity_War_poster.jpg" alt="Avengers: Infinity War">
      <h2>Avengers: Infinity War</h2>
      <p>The Avengers must stop Thanos, an intergalactic warlord, from getting his hands on all the infinity stones. However, Thanos is prepared to go to any lengths to carry out his insane plan.</p>
    </li>
  </ul>
</main>
</panel>
<panel language="css"  hidden="true">
/* CSS Reset */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  background-color: #f2f2f2;
  font-family: Arial, sans-serif;
}

header {
  background-color: #5b83ce;
  color: #fff;
  text-align: center;
  padding: 20px;
}

header h1 {
  font-family: 'Pacifico', cursive;
  font-size: 44px;
  color: #fff;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
  padding: 20px;
}

main {
  max-width: 800px;
  margin: 20px auto;
  background-color: #c19696;
  border-radius: 5px;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
}

.movie-list {
  list-style: none;
  padding: 0;
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  padding: 20px;
}

.movie {
  width: calc(33.33% - 20px);
  background-color: #f2f2f2;;
  border-radius: 5px;
  padding: 10px;
  box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s ease-in-out;
}

.movie:hover {
  transform: scale(1.05);
}

.movie img {
  width: 100%;
  height: auto;
  border-radius: 5px;
  margin-bottom: 10px;
}

.movie h2 {
  font-size: 18px;
  margin-bottom: 5px;
  color: rgb(3, 77, 227);
}

.movie p {
  font-size: 14px;
  color: #1d0075;
}
</panel>
<panel language="javascript">
const title = "Avatar";
const description = "Jake, who is paraplegic, replaces his twin on the Na'vi inhabited Pandora for a corporate mission. After the natives accept him as one of their own, he must decide where his loyalties lie.";
const imageUrl = "https://upload.wikimedia.org/wikipedia/en/d/d6/Avatar_%282009_film%29_poster.jpg";

// Write code here
</panel>
</code>
<solution>
const title = "Avatar";
const description = "Jake, who is paraplegic, replaces his twin on the Na'vi inhabited Pandora for a corporate mission. After the natives accept him as one of their own, he must decide where his loyalties lie.";
const imageUrl = "https://upload.wikimedia.org/wikipedia/en/d/d6/Avatar_%282009_film%29_poster.jpg";

// Write code here
const newMovie = document.createElement("li");
newMovie.classList.add("movie");

const poster = document.createElement("img");
poster.src = imageUrl;
poster.alt = title;

const movieTitle = document.createElement("h2");
movieTitle.innerText = title;

const movieDescription = document.createElement("p");
movieDescription.innerText = description;

newMovie.appendChild(poster);
newMovie.appendChild(movieTitle);
newMovie.appendChild(movieDescription);

const movieList = document.querySelector(".movie-list");
movieList.appendChild(newMovie);
</solution>
</codeblock>

We are not displaying answer to this exercise.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2d8ias5ud-ywkjF1xRyV9Nbne1_sGQag) to join the community.
