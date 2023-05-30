If the details of a country are provided in the below format:

|Key | Value |
|--|--|
|name | Uruguay |
|populationAsof2022 | 3407213 |
|areaInKMSquare | 181034 |
|worldCupWinningYears| 1930, 1950 |

Write a code that takes in these country details to perform the following actions:

  * You need to print the population density of the provided countries in the following format:
    * `The population density of [Country Name] is [Population Density].`
    * [Population Density]] = population / area in square kilometer.
  * You need to print the total number of years the country has won the FIFA Football World Cup based on `worldCupWinningYears` in the format:
   * `[Country Name] has won [total number of years won] FIFA World Cups"`

Make sure your code is flexible enough to work with any value of the `countryDetails` variable that meets these requirements.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const displayCountryFacts = (countryDetails) => {
	// write your code here
}
</code>

<solution>
const displayCountryFacts = (countryDetails) => {
  // Calculate population density
  const populationDensity = countryDetails.populationAsof2022 / countryDetails.areaInKMSquare;

  // Log population density
  console.log(`The population density of ${countryDetails.name} is ${populationDensity}.`);

  // Calculate total number of world cup wins
  const totalWorldCupWins = countryDetails.worldCupWinningYears.length;

  // Print the total number of world cup wins
  console.log(`${countryDetails.name} has won ${totalWorldCupWins} FIFA World Cups.`);
};
</solution>
<testcases>
<caller>
displayCountryFacts(countryDetails);
</caller>
<testcase>
<i>
const countryDetails = {
  name: 'Uruguay',
  populationAsof2022: 3407213,
  areaInKMSquare: 181034,
  worldCupWinningYears: [1930, 1950],
};
</i>
</testcase>
<testcase>
<i>
const countryDetails = {
  name: 'Brazil',
  populationAsof2022: 217240060,
  areaInKMSquare: 8515767,
  worldCupWinningYears: [1958, 1962, 1970, 1994, 2002],
};
</i>
</testcase>
<testcase>
<i>
const countryDetails = {
  name: 'Argentina',
  populationAsof2022: 46044703,
  areaInKMSquare: 2780400,
  worldCupWinningYears: [1978, 1986, 2022],
};
</i>
</testcase>
<testcase>
<i>
const countryDetails = {
  name: 'Germany',
  populationAsof2022: 8427062,
  areaInKMSquare: 357592,
  worldCupWinningYears: [1954, 1974, 1990, 2014],
};
</i>
</testcase>
<testcase>
<i>
const countryDetails = {
  name: 'Spain',
  populationAsof2022: 47325360,
  areaInKMSquare: 505990,
  worldCupWinningYears: [2010],
};
</i>
</testcase>
</testcases>
</codeblock>
