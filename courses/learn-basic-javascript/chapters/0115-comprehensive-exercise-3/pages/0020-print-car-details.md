If the details of a car are provided in the below format:

|Key | Value |
|--|--|
|name |Tata Nexon |
|manufacturer |Tata |
|countryOfOrigin | India |
|colour | blue|
|supportElectricOption| true|
|electricOptionNotAvailableNow| false |

Write a code that takes in these car details to perform the following actions:

* You need to print the value of either `carDetails.supportElectricOption` or `carDetails.electricOptionNotAvailableNow`, depending on which one is truthy to the console.

* Add a check to make sure the below conditions is executed only if the car is Electric.

* If it is electric, then print the welcome message:
`Electric cars are the future! The car we are presenting now is called [Name Here].`

* You need to print the following statements based on the associated conditions:  
	
	* If the car manufacturer's origin is in India: `This car is made in India.`
	* If not: `The country of origin is [Name of the country].`

  	* If the car's colour is black: `The car's colour is metallic black.`
  	* If it is white: `The car's colour is snow blush.`
  	* If it is neither black nor white: `This car is neither black nor white.`

Make sure your code is flexible enough to work with any value of the `carDetails` variable that meets these requirements.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const displayCarDetails = (carDetails) => {
	// write your code here
}
</code>

<solution>
const displayCarDetails = (carDetails) => {
  console.log(`Electric cars are the future! The car we are presenting now is called ${carDetails.name}.`);

  //nullish coalescing operator
  console.log(carDetails.supportElectricOption ?? carDetails.electricOptionNotAvailableNow);

  //If else statement
  if (carDetails.supportElectricOption) {
    if (carDetails.countryOfOrigin === "India") {
      console.log("This car is made in India.");
    } else {
      console.log(`The country of origin is ${carDetails.countryOfOrigin}.`);
    }

    //If, else if, else statement
    if (carDetails.colour === "black") {
      console.log("The car's colour is metallic black.");
    } else if (carDetails.colour === "white") {
      console.log("The car's colour is snow blush.");
    } else {
      console.log("This car's colour is neither black nor white.");
    }
  }
};
</solution>
<testcases>
<caller>
displayCarDetails(carDetails);
</caller>
<testcase>
<i>
const carDetails = {
	name: "Tata Nexon",
	manufacturer: "Tata",
	countryOfOrigin: "India",
	colour: "blue",
	supportElectricOption: true,
	electricOptionNotAvailableNow: false
}
</i>
</testcase>
<testcase>
<i>
const carDetails = {
	name: "Mahindra XUV400 EV",
	manufacturer: "Mahindra & Mahindra",
	countryOfOrigin: "India",
	colour: "white",
	supportElectricOption: true,
	electricOptionNotAvailableAsof2023: false
}
</i>
</testcase>
<testcase>
<i>
const carDetails = {
	name: "Model S",
	manufacturer: "Tesla",
	countryOfOrigin: "USA",
	colour: "red",
	supportElectricOption: true,
	electricOptionNotAvailableAsof2023: false
}
</i>
</testcase>
<testcase>
<i>
const carDetails = {
	name: "NotElectricCar",
	manufacturer: "NotIntoElectricYet",
	countryOfOrigin: "Somewhere",
	colour: "Purple",
	supportElectricOption: false,
	electricOptionNotAvailableAsof2023: true
}
</i>
</testcase>
<testcase>
<i>
const carDetails = {
	name: "Mahindra Bolero Neo",
	manufacturer: "Mahindra & Mahindra",
	countryOfOrigin: "India",
	colour: "black",
	supportElectricOption: false,
	electricOptionNotAvailableAsof2023: true
}
</i>
</testcase>
</testcases>
</codeblock>
