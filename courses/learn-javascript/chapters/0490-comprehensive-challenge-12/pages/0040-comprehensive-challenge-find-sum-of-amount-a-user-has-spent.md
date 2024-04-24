Find the sum of the amount spent by the given user from the given expense details.

For example:
```js
Input:
expenses = [
  {
    spentOn: "Coffee",
    amount: 120
  },
  {
    spentOn: "Mobile Bill",
    amount: 600
  },
  {
    spentOn: "Gym Membership",
    amount: 1500
  },
  {
    spentOn: "Travel",
    amount: 1000
  },
  {
    spentOn: "Home Utilities",
    amount: 2500
  }
];

Output:
6720
```
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
<testcase>
<i>
const expenses = [
  {
    spentOn: "Electronics",
    amount: 1500
  },
  {
    spentOn: "Dinner",
    amount: 700
  },
  {
    spentOn: "Fitness",
    amount: 450
  },
  {
    spentOn: "Books",
    amount: 890
  },
  {
    spentOn: "Clothing",
    amount: 2100
  }
];
</i>
</testcase>
<testcase>
<i>
const expenses = [
  {
    spentOn: "Coffee",
    amount: 120
  },
  {
    spentOn: "Mobile Bill",
    amount: 600
  },
  {
    spentOn: "Gym Membership",
    amount: 1500
  },
  {
    spentOn: "Travel",
    amount: 1000
  },
  {
    spentOn: "Home Utilities",
    amount: 2500
  }
];
</i>
</testcase>
</testcases>
</codeblock>
