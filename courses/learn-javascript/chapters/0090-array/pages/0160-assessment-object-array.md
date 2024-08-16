Choose appropriate data
type to store the following
details of a movie:

| Key        | Value             |
| ---------- | ----------------- |
| name       | "Unbelievable"    |
| genre      | "Crime", "Drama"  |
| cast       | "Lisa Cholodenko" |
|            | "Michael Dinner"  |
|            | "Susannah Grant"  |
|            | "Merritt Wever"   |
| imdbRating | 6                 |

Then update the IMDB rating
of the movie to be 10.

Log to the console an array with all the
details of the movie. In
a way that only values are printed.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
// Write your code here
</code>
<solution>
// Write your code here
const movieDetails = {
  name: "Unbelievable",
  genre: ["Crime", "Drama" ],
  cast: ["Lisa Cholodenko", "Michael Dinner", "Susannah Grant", "Merritt Wever"],
  imdbRating: 6
};

movieDetails.imdbRating = 10;
console.log(Object.values(movieDetails));

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
