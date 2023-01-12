Follow the steps given below
to write a program:

1. Create an object **employee** with
   the following key-value pairs -
   `skill: "Software"`,
   `employmentDuration: 6`.
   Also, create a variable `numberOfGiftCoupons`
   with the value `20`.

2. Re-assign the value of
   the variable `numberOfGiftCoupons`
   based on the following table.
   For the condition given
   in the first column,
   the value of the variable
   `numberOfGiftCoupons`
   should be the value given
   in the second column.

   | Condition                                                                      | Value |
   | ------------------------------------------------------------------------------ | ----- |
   | Value of `skill` is **"Software"** and `employmentDuration` is **7** or more   | 100   |
   | Value of `skill` is **"Management"** or, `employmentDuration` is **5** or more | 80    |
   | Any other value of `skill` and `employmentDuration`                            | 20    |

3. Using `console.log`, display
  **"Number of gift-coupons: "**
  followed by the value of `numberOfGiftCoupons`.
  For example, if the value of `numberOfGiftCoupons` is `20`,
  the output should be - **"Number of gift-coupons: 20"**

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here.
</code>

<solution>
const employee = {
  skill: "Software",
  employmentDuration: 6
}

let numberOfGiftCoupons = 20;

if (employee.skill === "Software" && employee.employmentDuration >= 7) {
  numberOfGiftCoupons = 100;
} else if (employee.skill === "Management" || employee.employmentDuration >= 5) {
  numberOfGiftCoupons = 80;
}

console.log(`Number of gift-coupons: ${numberOfGiftCoupons}`);
</solution>
</codeblock>