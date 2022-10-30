Print the Registration Details

1. Modify the caller function to achive the desired output.
2. Do not rename "callerFn"

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const car = {
  registrationNumber: "LAX1234",
  brand: "Ford",
};
function displayDetails(ownerName) {
  return JSON.stringify(
    ownerName +
      ", this is your car: " +
      this.registrationNumber +
      " " +
      this.brand
  );
}
const callerFn = // your code here
</code>

<solution>
const car = {
  registrationNumber: "LAX1234",
  brand: "Ford",
};
function displayDetails(ownerName) {
  return JSON.stringify(
    ownerName +
      ", this is your car: " +
      this.registrationNumber +
      " " +
      this.brand
  );
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
</testcases>
</Editor>