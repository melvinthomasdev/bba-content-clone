Given an object with vacation details, return the same after adding a `startDate` property, in the format of `"Fri Dec 07 2018"` as per the year and day input passed to it.

1. Only add `startDate` property if it's not present in the object.
2. Try using [Logical nullish](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Nullish_coalescing_assignment) assignment.
3. Month should always be set as `December`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const addMissingProperty = ({ vacationDetails, day, year }) => {
  // write your code here
}
</code>

<solution>
const addMissingProperty = ({ vacationDetails, day, year }) => {
  let startDate = vacationDetails.startDate
  startDate ??= new Date(year, 11, day).toDateString();
  return ({
    ...vacationDetails,
    startDate
  });
}
</solution>

<testcases>
<caller>
console.log(addMissingProperty({ vacationDetails, day, year }));
</caller>
<testcase>
<i>
const vacationDetails = {
  tripId: 5,
  destination: "Wayanad",
  startDate: "Fri Dec 07 2018",
  hotelPhoneNumber: 030303,
  hotelEmailAddress: "hij789@example.com",
};
const day = 09;
const year = 2020;
</i>
</testcase>
<testcase>
<i>
const vacationDetails = {
  tripId: 4,
  destination: "Ladakh",
  hotelPhoneNumber: 020202,
  hotelEmailAddress: "efg456@example.com",
};
const day = 15;
const year = 2017;
</i>
</testcase>
<testcase>
<i>
const vacationDetails = {
  tripId: 3,
  destination: "Reykjavík",
  hotelPhoneNumber: 010101,
  hotelEmailAddress: "abc123@example.com",
};
const day = 11;
const year = 2016;
</i>
</testcase>
</testcases>
</codeblock>