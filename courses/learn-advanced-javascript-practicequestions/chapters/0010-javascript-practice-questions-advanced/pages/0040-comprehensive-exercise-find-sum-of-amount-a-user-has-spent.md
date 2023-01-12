Find the sum of the amount spent by the given user from the given expense details.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const totalExpenses = expenses => // write your code here
</code>

<solution>
const totalExpenses = expenses =>
  expenses.reduce((totalAmount, { amount }) => amount + totalAmount, 0);
</solution>

<testcases>
<caller>
console.log(totalExpenses(expenses));
</caller>
<testcase>
<i>
const expenses = [
  {
    spentOn: "Movie",
    amount: 500
  },
  {
    spentOn: "Tram",
    amount: 200
  },
  {
    spentOn: "Lunch",
    amount: 290
  },
  {
    spentOn: "Groceries",
    amount: 3290
  },
  {
    spentOn: "Fashion",
    amount: 8290
  }
];
</i>
</testcase>
<testcase>
<i>
const expenses = [
  {
    spentOn: "Train",
    amount: 300
  },
  {
    spentOn: "Vegetables",
    amount: 800
  },
  {
    spentOn: "Dairy",
    amount: 300
  },
  {
    spentOn: "Stationary",
    amount: 1200
  },
  {
    spentOn: "Fuel",
    amount: 3200
  }
];
</i>
</testcase>
</testcases>
</codeblock>