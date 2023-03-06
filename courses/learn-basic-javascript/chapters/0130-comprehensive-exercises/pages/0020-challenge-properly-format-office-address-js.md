Given below is the office address of Google:

|Key       |Value           |
|--|--|
|name      |Google Inc |
|address   |1600 Amphitheatre Pkwy  |
|city      |Mountain View             |
|state     |CA           |
|zip       |94043 |
|country   |USA |

Write a program that takes in office details to print the office address in the format as shown below:
```
Google Inc
1600 Amphitheatre Pkwy
Mountain View, CA 94043
USA
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
//Write code here
</code>

<solution>
const officeDetails = {
	"name": "Google Inc",
	"address": "1600 Amphitheatre Pkwy",
	"city": "Mountain View",
	"state": "CA",
	"zip": "94043",
	"country": "USA"
};
const address = (office) => {
	console.log(office["name"]);
	console.log(office["address"]);
	console.log(office["city"] + ", " + office["state"] + " " + office["zip"]);
	console.log(office["country"]);
};
address(officeDetails);
</solution>
<testcases>
<caller>
address(newOfficeDetails);
</caller>
<testcase>
<i>
const newOfficeDetails = {
	"name": "Amazon.com",
	"address": "410 Terry Ave N",
	"city": "Seattle",
	"state": "WA",
	"zip": "98109",
	"country": "USA"
};
</i>
</testcase>
<testcase>
<i>
const newOfficeDetails = {
	"name": "Flipkart India",
	"address": "Vaishnavi Summit, Ground Floor, 7th Main, 80 Feet Road, 3rd Block, Koramangala Industrial Layout",
	"city": "Bangalore",
	"state": "KA",
	"zip": "560034",
	"country": "IN"
};
</i>
</testcase>
<testcase>
<i>
const newOfficeDetails = {
	"name": "Bewakoof Brands",
	"address": "Chromium, Jogeshwari - Vikhroli Link Rd, Andheri East",
	"city": "Mumbai",
	"state": "MH",
	"zip": "400076",
	"country": "IN"
};
</i>
</testcase>
</testcases>
</codeblock>
