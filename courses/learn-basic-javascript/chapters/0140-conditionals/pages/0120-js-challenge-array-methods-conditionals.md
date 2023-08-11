Create a list containing
these 5 players from team A.
- Eve Smith
- Sam Smith
- Renu Sen
- Lao Xun
- Linh Tran

Assign this value to a variable
named `playerList` and it's value
should be an appropriate datatype
of your choice.

Remove last name from
the above list and replace it
with `Chinua Achebe`
and
log the resulting list
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
// Write code here
</code>
<solution>
const playerList = ["Eve Smith", "Sam Smith", "Renu Sen", "Lao Xun", "Linh Tran"];

playerList.pop();
playerList.push("Chinua Achebe");

console.log(playerList);
</solution>
</codeblock>

Create another list with
these 5 movies from the
Marvel franchise:
```js
  Iron Man
  Thor
  Black Widow
  Captain Marvel
  Guardians of the Galaxy Vol. 1
```
- Assign this value to a variable named
  `marvelCharacters` of an appropriate datatype.
- Log to the console, the index position of the
  movie `Captain Marvel` in the above created list.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
// Write code here
</code>
<solution>
// Write code here
const marvelCharacters = [
  "Iron Man",
  "Thor",
  "Black Widow",
  "Captain Marvel",
  "Guardians of the Galaxy Vol. 1"
];

console.log(marvelCharacters.indexOf("Captain Marvel"));
</solution>
</codeblock>

Given is a movie list.

Log to the console the
total number of movies
mentioned in the list.

Add a new movie `Interstellar`
at the end of the list.

Log the following sentence to
the console:
`My favorite movie from the list above is The Shawshank redemption.`

Note: Avoid hardcoding movie name in the sentence.
Instead use the index of the movie in the list.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const movies = [
  'Spiderman',
  'Batman',
  'X-Men',
  'Gone with the wind',
  'The Shawshank redemption',
  'Saving Private Ryan',
  'Spy Kids',
  'Jumanji',
  'Police story',
  'The Kid'
];
// Write your code here
</code>
<solution>
const movies = [
  'Spiderman',
  'Batman',
  'X-Men',
  'Gone with the wind',
  'The Shawshank redemption',
  'Saving Private Ryan',
  'Spy Kids',
  'Jumanji',
  'Police story',
  'The Kid'
];
// Write your code here

movies.push('Interstellar');
console.log(`My favorite movie from the list above is ${movies[10]}.`);
</solution>
</codeblock>
