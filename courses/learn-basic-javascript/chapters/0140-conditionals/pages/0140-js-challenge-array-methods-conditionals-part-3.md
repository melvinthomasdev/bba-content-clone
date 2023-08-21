You are provided with a
list of movies.

- Log to the console, the
  total number of movies
  mentioned in the list.

- Add a new movie of your
  choice at the end of
  the list.

- Log to the console in the following format:

  **My favorite movie from the list above is Drishyam.**

**Note:** Do not hardcode
the movie name in the sentence.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const malayalamMovies = [
  'Kumbalangi Nights',
  'Koodi',
  'Drishyam',
  'Vettam',
  'Lucifer',
  'Uyare',
  'Premam',
  'Maheshinte Prathikaram',
  'Bangalore Days',
  'Charlie',
  'Ayyappanum Koshiyum',
  'Njan Prakashan'
];
// Write your code here
</code>
<solution>
const malayalamMovies = [
  'Kumbalangi Nights',
  'Koodi',
  'Drishyam',
  'Vettam',
  'Lucifer',
  'Uyare',
  'Premam',
  'Maheshinte Prathikaram',
  'Bangalore Days',
  'Charlie',
  'Ayyappanum Koshiyum',
  'Njan Prakashan'
];
console.log(malayalamMovies.length);
malayalamMovies.push("Vichithram");
console.log(`My favorite movie from the list above is ${malayalamMovies[2]}.`);
</solution>
</codeblock>
