The function `sortCapitals` should return an alphabetically sorted list based on the capitals of each state.

For example:
```js
Input:
const states = [
    { state: "Maharashtra", capital: "Mumbai", official_Language: 'Marathi' },
    { state: "Gujarat", capital: "Gandhinagar", official_Language: 'Gujarati' },
    { state: "Rajasthan", capital: "Jaipur", official_Language: 'Hindi' }
  ];

Output:
[
  { state: 'Gujarat', capital: 'Gandhinagar', official_Language: 'Gujarati' },
  { state: 'Maharashtra', capital: 'Mumbai', official_Language: 'Marathi' },
  { state: 'Rajasthan', capital: 'Jaipur', official_Language: 'Hindi' }
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
    { state: "Manipur", capital: "Imphal", official_Language: 'Meiteilon' },
    { state: "Assam", capital: "Dispur", official_Language: 'Assamese' },
    { state: "Meghalaya	", capital: "Shillong", official_Language: 'English' }
  ];
</i>
</testcase>
<testcase>
<i>
const states = [
    { state: "Chhattisgarh", capital: "Naya Raipur", official_Language: 'Chhattisgarhi' },
    { state: "Goa", capital: "Panaji", official_Language: 'Konkani' },
    { state: "Odisha", capital: "Bhubaneswar", official_Language: 'Oriya' }
  ];
</i>
</testcase>
<testcase>
<i>
const states = [
    { state: "Karnataka", capital: "Bengaluru", official_Language: 'Kannada' },
    { state: "Kerala", capital: "Thiruvananthapuram", official_Language: 'Malayalam' },
    { state: "Tamil Nadu", capital: "Chennai", official_Language: 'Assamese' }
  ];
</i>
</testcase>
<testcase>
<i>
const states = [
    { state: "Maharashtra", capital: "Mumbai", official_Language: 'Marathi' },
    { state: "Gujarat", capital: "Gandhinagar", official_Language: 'Gujarati' },
    { state: "Rajasthan", capital: "Jaipur", official_Language: 'Hindi' }
  ];
</i>
</testcase>
</testcases>
</codeblock>
