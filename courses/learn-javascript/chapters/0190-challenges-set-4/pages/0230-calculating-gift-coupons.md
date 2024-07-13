The function `calculateGiftCoupons` takes an object
**employee** as input and
returns the number of gift coupons based on
the employee's skill and employment duration.
The function determines the value of **numberOfGiftCoupons**
based on the following conditions.

| Condition                                                                      | Value |
| ------------------------------------------------------------------------------ | ----- |
| Value of `skill` is **Software** and `employmentDuration` is **7** or more   | 100   |
| Value of `skill` is **Management** or, `employmentDuration` is **5** or more | 80    |
| Any other value of `skill` and `employmentDuration`                            | 20    |

Display the number of gift-coupons followed by the value of numberOfGiftCoupons.

For example:
```js
Input:
employee = {
  skill: "Software",
  employmentDuration: 8
}

Output:
"Number of gift-coupons: 10"
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function calculateGiftCoupons(employee) {
  let numberOfGiftCoupons = 20;
  // your code here
}
</code>

<solution>
function calculateGiftCoupons(employee) {
  let numberOfGiftCoupons = 20;

  if (employee.skill === "Software" && employee.employmentDuration >= 7) {
    numberOfGiftCoupons = 100;
  } else if (employee.skill === "Management" || employee.employmentDuration >= 5) {
    numberOfGiftCoupons = 80;
  }

  return `Number of gift-coupons: ${numberOfGiftCoupons}`;
}
</solution>

<testcases>
<caller>
console.log(calculateGiftCoupons(employee));
</caller>
<testcase>
<i>
employee = {
  skill: "Software",
  employmentDuration: 8
},
</i>
</testcase>
<testcase>
<i>
employee = {
  skill: "Software",
  employmentDuration: 6
},
</i>
</testcase>
<testcase>
<i>
employee = {
  skill: "Management",
  employmentDuration: 4
},
</i>
</testcase>
<testcase>
<i>
employee = {
  skill: "HR",
  employmentDuration: 5
},
</i>
</testcase>
</testcases>
</codeblock>
