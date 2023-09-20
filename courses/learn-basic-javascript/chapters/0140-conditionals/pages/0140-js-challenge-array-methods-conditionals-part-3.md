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

We do not display answers in this exercise.
We do this because we want students to challenge
themselves and not give in to the temptation of taking
a peek at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.
Here's the link to join: **[Link](https://bigbinaryacademy.slack.com/join/shared_invite/zt-23dvxwolx-U9LYYbv4ycmODEA1cbNFgA#/shared-invite/email)**.
