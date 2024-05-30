The function `sortCapitals` should return an alphabetically sorted list based on the capitals of each state.

For example:
```js
Input:
states = [
    { state: "Maharashtra", capital: "Mumbai", official_language: "Marathi" },
    { state: "Gujarat", capital: "Gandhinagar", official_language: "Gujarati" },
    { state: "Rajasthan", capital: "Jaipur", official_language: "Hindi" }
  ];

Output:
states = [
  { state: "Gujarat", capital: "Gandhinagar", official_language: "Gujarati" },
  { state: "Rajasthan", capital: "Jaipur", official_language: "Hindi" },
  { state: "Maharashtra", capital: "Mumbai", official_language: "Marathi" }
]
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sortCapitals = states => {
  // your code here
}
</code>

<solution>
const sortCapitals = states =>
  (
    [...states].sort((state1, state2) => {
      if (state1.capital < state2.capital) return -1;

      if (state1.capital > state2.capital) return 1;

      return 0;
    })
  );
</solution>

<testcases>
<caller>
console.log(sortCapitals(states));
</caller>
<testcase>
<i>
const states = [
    { state: "Manipur", capital: "Imphal", official_language: 'Meiteilon' },
    { state: "Assam", capital: "Dispur", official_language: 'Assamese' },
    { state: "Meghalaya	", capital: "Shillong", official_language: 'English' }
  ];
</i>
</testcase>
<testcase>
<i>
const states = [
    { state: "Chhattisgarh", capital: "Naya Raipur", official_language: 'Chhattisgarhi' },
    { state: "Goa", capital: "Panaji", official_language: 'Konkani' },
    { state: "Odisha", capital: "Bhubaneswar", official_language: 'Oriya' }
  ];
</i>
</testcase>
<testcase>
<i>
const states = [
    { state: "Karnataka", capital: "Bengaluru", official_language: 'Kannada' },
    { state: "Kerala", capital: "Thiruvananthapuram", official_language: 'Malayalam' },
    { state: "Tamil Nadu", capital: "Chennai", official_language: 'Assamese' }
  ];
</i>
</testcase>
<testcase>
<i>
const states = [
    { state: "West Bengal", capital: "Kolkata", official_language: "Bengali" },
    { state: "Punjab", capital: "Chandigarh", official_language: "Punjabi" }
    { state: "Kerala", capital: "Thiruvananthapuram", official_language: "Malayalam" },
    { state: "Chhattisgarh", capital: "Naya Raipur", official_language: 'Chhattisgarhi' }
  ];
</i>
</testcase>
</testcases>
</codeblock>
