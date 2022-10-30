​
Improve the code
given in the example given below,
so that we get the following
result displayed on the console:
`January: 31 days. First month of the year.`
​
<Editor type="exercise" lang="javascript">
<code>
let firstMonth = {name: "January"};

function monthDetails(numberOfDays, message) {
  console.log();
}

let firstMonthDetails = monthDetails.bind(firstMonth);
firstMonthDetails()
</code>

<solution>
let firstMonth = {name: "January"};

function monthDetails(numberOfDays, message) {
  console.log(this.name + numberOfDays + ". "  + message);
}

let firstMonthDetails = monthDetails.bind(firstMonth);
firstMonthDetails(": 31 days", "First month of the year.")
</solution>
</Editor>
​

​
