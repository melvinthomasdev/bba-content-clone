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

Log to the console all the
details of the movie, in
a way that only values and
not the properties are printed.

Expected output:
```js
Unbelievable 
Crime, Drama
Lisa Cholodenko, Michael Dinner, Susannah Grant
Merritt Wever
10
```

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
