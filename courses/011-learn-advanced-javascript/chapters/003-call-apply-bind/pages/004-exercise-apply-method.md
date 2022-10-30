​
Improve the code
given in the example given below,
so that we get the following
result displayed on the console:
`January: 31 days. First month of the year.`
​
<Editor type="exercise" lang="javascript">
<code>
let month = {name: "January"};

function monthDetails(numberOfDays, message) {
  console.log();
}

monthDetails.apply(month, [": 31 days", "First month of the year."]);
</code>

<solution>
let month = {name: "January"};

function monthDetails(numberOfDays, message) {
  console.log(this.name + numberOfDays + ". "  + message);
}

monthDetails.apply(month, [": 31 days", "First month of the year."]);
</solution>
</Editor>
​

​
