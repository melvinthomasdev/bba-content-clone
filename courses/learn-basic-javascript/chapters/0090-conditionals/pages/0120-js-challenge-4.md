Create a list containing
these 5 players form
`Argentina national football team`:
- Franco Armani
- Cristian Romero
- Nahuel Molina
- Enzo Fernández
- Lionel Messi

Assign this value to a variable
that is named accordingly and it's
value should be an appropriate
datatype of your choice.

Remove last player from
the above list and update it
with the `Paulo Dybala`
and log the resulting list
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
// Write code here
</code>
<solution>
const argentinaNationalFootballTeam = ["Franco Armani", "Cristian Romero", "Nahuel Molina", "Enzo Fernández", "Lionel Messi"];

argentinaNationalFootballTeam.pop();
argentinaNationalFootballTeam.push("Paulo Dybala");

console.log(argentinaNationalFootballTeam);
</solution>
</codeblock>

Create another list with
these 5 movies from the
Marvel franchise.
```js
  Iron Man
  Thor
  Black Widow
  Captain Marvel
  Guardians of the Galaxy Vol. 1
```
- Use an appropriate datatype of your choice.
- Assign this value to a variable that is properly named. 
- Make sure they are added in the order of "release date" (NOT in chronological order)
- Log to the console, the index position of the movie "Captain Marvel" in above created list.

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
// Write code here
</code>
<solution>
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

Add a new movie of your
choice at the end of
the list.

Log to the console in
the format:
"My favorite movie from the list above is Drishyam."

Note: Do not hardcode
the movie name in the sentence.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
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

malayalamMovies.push("Vichithram");
console.log(`My favorite movie from the list above is ${malayalamMovies[2]}.`);
</solution>
</codeblock>
