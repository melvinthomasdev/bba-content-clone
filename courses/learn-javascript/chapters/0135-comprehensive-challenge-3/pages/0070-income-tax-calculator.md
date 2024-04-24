Update the function **calculateTax** to calculate the income tax for a given salary and age group in a fictional country. The function should consider the salary amount and the age of the individual to determine the tax rate.

The function parameters are,

- **salary (number):** It represents the annual salary of the individual in the local currency.
- **age (number):** It represents the age of the individual.

The income tax is calculated based on the following criteria,

For individuals aged 60 years or below,

- No tax for salaries up to ₹2,50,000.
- 5% tax for salaries above ₹2,50,000 and up to ₹5,00,000.
- 10% tax for salaries above ₹5,00,000.

For individuals aged above 60 years,

- No tax for salaries up to ₹3,00,000.
- 5% tax for salaries above ₹3,00,000 and up to ₹5,00,000.
- 10% tax for salaries above ₹5,00,000.

The function should return a string indicating the tax amount based on the salary and age, for example, **"Tax amount is ₹X"**, where X is the calculated tax.

For example:
```js
Input:  salary = 400000, age = 30

Output: 'Tax amount is ₹7500'
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const calculateIncomeTax = (salary, age) => {
  // write your code here
}
</code>

<solution>
const calculateIncomeTax = (salary, age) => {
  // write your code here
  let taxRate = 0;
  let taxAmount = 0;

  if (age <= 60) {
    if (salary > 250000 && salary <= 500000) {
      taxRate = 0.05;
    } else if (salary > 500000) {
      taxRate = 0.10;
    }
  } else {
    if (salary > 300000 && salary <= 500000) {
      taxRate = 0.05;
    } else if (salary > 500000) {
      taxRate = 0.10;
    }
  }

  taxAmount = (salary - (age <= 60 ? 250000 : 300000)) * taxRate;
  taxAmount = taxAmount > 0 ? taxAmount : 0; // Ensuring tax amount is not negative

  return `Tax amount is ₹${taxAmount}`;
}

</solution>
<testcases>
<caller>
console.log(calculateIncomeTax(salary, age));
</caller>
<testcase>
<i>
const salary = 400000;
const age = 30;
</i>
</testcase>
<testcase>
<i>
const salary = 600000;
const age = 65;
</i>
</testcase>
<testcase>
<i>
const salary = 200000;
const age = 40;
</i>
</testcase>
<testcase>
<i>
const salary = 550000;
const age = 55;
</i>
</testcase>
</testcases>
</codeblock>
