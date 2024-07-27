Given below is a function **changeCityName**
that takes two parameters. 
The first is the name of a city, and 
the second is a callback 
function that makes changes 
to the name of the city.

Run this function once and 
provide it two values. First, 
provide it a value **Tokyo**. Then, 
as the next argument, provide it 
an anonymous function that returns 
the value **TOKYO**. Save the returned 
value in a variable and then log it to the 
console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const changeCityName = (cityName, makeChanges) => {
  return makeChanges(cityName);
}

// Write your code below this line

</code>
<solution>
const changeCityName = (cityName, makeChanges) => {
  return makeChanges(cityName);
}

// Write your code below this line
const updatedCityName = changeCityName("Tokyo", (val) => val.toUpperCase());
console.log(updatedCityName);
</solution>
</codeblock>
