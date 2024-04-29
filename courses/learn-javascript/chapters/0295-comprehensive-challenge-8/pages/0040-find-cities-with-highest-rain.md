Write a program to find the
names of all the cities
where it rained more
than 100 days. Store these
city names in an array and
display the array result on the
screen.

For example:
```js
Input:
data = {
  "Houston": 104,
  "Atlanta": 113,
  "Austin": 88,
  "Baltimore": 116,
  "Boston": 126,
  "Dallas": 81
}

Output: ["Houston", "Atlanta", "Baltimore", "Boston"]
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const data = {
  "Houston": 104,
  "Atlanta": 113,
  "Austin": 88,
  "Baltimore": 116,
  "Boston": 126,
  "Dallas": 81
}
</code>

<solution>
const data = {
  "Houston": 104,
  "Atlanta": 113,
  "Austin": 88,
  "Baltimore": 116,
  "Boston": 126,
  "Dallas": 81
};

const dataEntries = Object.entries(data);
const citiesWithRain = dataEntries.reduce((cities, keyAndValue) => {
if (keyAndValue[1] > 100) return [...cities, keyAndValue[0]];

return cities
}, [])

console.log(citiesWithRain)
</solution>
</codeblock>
