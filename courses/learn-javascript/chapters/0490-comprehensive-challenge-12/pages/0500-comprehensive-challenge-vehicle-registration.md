Print the Registration Details

1. Modify the caller function to achieve the desired output.
2. Do not rename `callerFn`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const car = {
  registrationNumber: "LAX1234",
  brand: "Ford",
};

function displayDetails(ownerName){
  return `${ownerName}, this is your car: ${this.registrationNumber} ${this.brand}`;
}

const callerFn = // your code here
</code>

<solution>
const car = {
  registrationNumber: "LAX1234",
  brand: "Ford",
};

function displayDetails(ownerName){
  return `${ownerName}, this is your car: ${this.registrationNumber} ${this.brand}`;
}

const callerFn = displayDetails.bind(car);
</solution>

<testcases>
<caller>
console.log(callerFn(str));
</caller>
<testcase>
<i>
const str = "John";
</i>
</testcase>
<testcase>
<i>
const str = "Sam";
</i>
</testcase>
<testcase>
<i>
const str = "Oliver";
</i>
</testcase>
<testcase>
<i>
const str = "Nicolas";
</i>
</testcase>
</testcases>
</codeblock>