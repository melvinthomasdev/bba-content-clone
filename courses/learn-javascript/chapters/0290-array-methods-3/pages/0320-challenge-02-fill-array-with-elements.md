Change the array given in the
code so that all the elements
inside it are just the value
**Data Unavailable** and nothing
else.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const weatherData = [
  [
    "Location: New York City",
    "Temperature: 75°F",
    "Condition: Sunny",
    "Humidity: 60%",
    "Wind Speed: 5 mph"
  ],

  {
    location: "Los Angeles",
    temperature: 85,
    condition: "Clear",
    humidity: 30,
    windSpeed: 8
  },

  [
    {
      location: "Chicago",
      temperature: 65,
      condition: "Cloudy",
      humidity: 75,
      windSpeed: 10
    },
    {
      location: "Detroit",
      temperature: 68,
      condition: "Overcast",
      humidity: 70,
      windSpeed: 9
    }
  ],

  {
    location: "Miami",
    temperature: 90,
    condition: "Thunderstorms",
    humidity: 80,
    windSpeed: 12
  },

  [
    "Location: Seattle",
    "Temperature: 60°F",
    "Condition: Rainy",
    "Humidity: 85%",
    "Wind Speed: 7 mph",
    "Location: Portland",
    "Temperature: 62°F",
    "Condition: Drizzle",
    "Humidity: 88%",
    "Wind Speed: 6 mph",
    "Location: Vancouver",
    "Temperature: 58°F",
    "Condition: Foggy",
    "Humidity: 90%",
    "Wind Speed: 5 mph"
  ]
];

// Write your code below this line

// Write your code above this line

console.log(weatherData);
</code>
<solution>
const weatherData = [
  [
    "Location: New York City",
    "Temperature: 75°F",
    "Condition: Sunny",
    "Humidity: 60%",
    "Wind Speed: 5 mph"
  ],

  {
    location: "Los Angeles",
    temperature: 85,
    condition: "Clear",
    humidity: 30,
    windSpeed: 8
  },

  [
    {
      location: "Chicago",
      temperature: 65,
      condition: "Cloudy",
      humidity: 75,
      windSpeed: 10
    },
    {
      location: "Detroit",
      temperature: 68,
      condition: "Overcast",
      humidity: 70,
      windSpeed: 9
    }
  ],

  {
    location: "Miami",
    temperature: 90,
    condition: "Thunderstorms",
    humidity: 80,
    windSpeed: 12
  },

  [
    "Location: Seattle",
    "Temperature: 60°F",
    "Condition: Rainy",
    "Humidity: 85%",
    "Wind Speed: 7 mph",
    "Location: Portland",
    "Temperature: 62°F",
    "Condition: Drizzle",
    "Humidity: 88%",
    "Wind Speed: 6 mph",
    "Location: Vancouver",
    "Temperature: 58°F",
    "Condition: Foggy",
    "Humidity: 90%",
    "Wind Speed: 5 mph"
  ]
];

// Write your code below this line
weatherData.fill("Data Unavailable");
// Write your code above this line

console.log(weatherData);
</solution>
</codeblock>
