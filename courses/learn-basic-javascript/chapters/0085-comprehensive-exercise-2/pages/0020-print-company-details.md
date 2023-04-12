If the details of an office are provided in the below format:

|Key       |Value           |
|--|--|
|name      |Tata Sons |
|address   |BOMBAY HOUSE 24 HOMI MODY STREET |
|city      |Mumbai |
|state     |Maharashtra |
|pinOrZipCode |400001 |
|country   |India |

Write a code that takes in these office details to print a statement in the format as shown below:

`[Company Name] is from [City Name], [State Name] in [Country Name]. Their pincode/zipcode is [Pin or Zip code].`

Make sure your code is flexible enough to work with any value of the `officeDetails` variable that meets these requirements.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const displayOfficeDetails = (officeDetails) => {
	//Write code here
}
</code>

<solution>
const displayOfficeDetails = (officeDetails) => {
    console.log(`${officeDetails.name} is from ${officeDetails.city}, ${officeDetails.state} in ${officeDetails.country}. Their pincode/zipcode is ${officeDetails.pinOrZipCode}.`);
}
</solution>
<testcases>
<caller>
displayOfficeDetails(officeDetails);
</caller>
<testcase>
<i>
const officeDetails = {
	name: "Tata Sons",
	address: "BOMBAY HOUSE 24 HOMI MODY STREET",
	city: "Mumbai",
	state: "Maharashtra",
	pinOrZipCode: "400001",
	country: "India"
};
</i>
</testcase>
<testcase>
<i>
const officeDetails = {
	name: "Google Inc",
	address: "1600 Amphitheatre Pkwy",
	city: "Mountain View",
	state: "California",
	pinOrZipCode: "94043",
	country: "USA"
};
</i>
</testcase>
<testcase>
<i>
const officeDetails = {
	name: "NeST",
	address: "Plot No. 2, Cochin Special Economic Zone (CSEZ)",
	city: "Kakkanad",
	state: "Kerala",
	pinOrZipCode: "682037",
	country: "India"
};
</i>
</testcase>
<testcase>
<i>
const officeDetails = {
	name: "Flipkart India",
	address: "Vaishnavi Summit, Ground Floor, 7th Main, 80 Feet Road, 3rd Block, Koramangala Industrial Layout",
	city: "Bangalore",
	state: "Karnataka",
	pinOrZipCode: "560034",
	country: "India"
};
</i>
</testcase>
</testcases>
</codeblock>
