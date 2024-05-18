If the details of an office are provided in the below format:

| Key          | Value                            |
| ------------ | -------------------------------- |
| name         | Tata Sons                        |
| address      | BOMBAY HOUSE 24 HOMI MODY STREET |
| city         | Mumbai                           |
| state        | Maharashtra                      |
| pinOrZipCode | 400001                           |
| country      | India                            |

Write a code that takes in these office details to print a statement in the format as shown below:

`[Company Name] is from [City Name], [State Name] in [Country Name]. Their pincode/zipcode is [Pin or Zip code].`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const officeDetails = {
	name: "Tata Sons",
	address: "BOMBAY HOUSE 24 HOMI MODY STREET",
	city: "Mumbai",
	state: "Maharashtra",
	pinOrZipCode: "400001",
	country: "India"
};

//Write your code here
</code>
<solution>
const officeDetails = {
	name: "Tata Sons",
	address: "BOMBAY HOUSE 24 HOMI MODY STREET",
	city: "Mumbai",
	state: "Maharashtra",
	pinOrZipCode: "400001",
	country: "India"
};

console.log(`${officeDetails.name} is from ${officeDetails.city}, ${officeDetails.state} in ${officeDetails.country}. Their pincode/zipcode is ${officeDetails.pinOrZipCode}.`);
</solution>
</codeblock>
