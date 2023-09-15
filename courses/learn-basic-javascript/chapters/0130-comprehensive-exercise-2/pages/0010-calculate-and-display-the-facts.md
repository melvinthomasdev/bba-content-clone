If the details of a country are provided in the below format:

| Key                  | Value      |
| -------------------- | ---------- |
| name                 | Uruguay    |
| populationAsof2022   | 3407213    |
| areaInKMSquare       | 181034     |
| worldCupWinningYears | 1930, 1950 |

Write a code that takes in the above country details to perform the following actions:

- You need to print the population density of the country in the following format:
  - `The population density of [Country Name] is [Population Density].`
  - [Population Density]] = population / area in square kilometer.
- You need to print the total number of years the country has won the FIFA Football World Cup based on `worldCupWinningYears` in the format:
- `[Country Name] has won [total number of years won] FIFA World Cups"`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const countryDetails = {
  name: 'Uruguay',
  populationAsof2022: 3407213,
  areaInKMSquare: 181034,
  worldCupWinningYears: [1930, 1950],
};

// write your code here

</code>
<solution>
const countryDetails = {
  name: 'Uruguay',
  populationAsof2022: 3407213,
  areaInKMSquare: 181034,
  worldCupWinningYears: [1930, 1950],
};

// Calculate population density
const populationDensity = countryDetails.populationAsof2022 / countryDetails.areaInKMSquare;

// Log population density
console.log(`The population density of ${countryDetails.name} is ${populationDensity}.`);

// Calculate total number of world cup wins
const totalWorldCupWins = countryDetails.worldCupWinningYears.length;

// Print the total number of world cup wins
console.log(`${countryDetails.name} has won ${totalWorldCupWins} FIFA World Cups.`);

</solution>
</codeblock>
