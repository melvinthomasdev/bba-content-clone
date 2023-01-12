List all the debt entries of customers who owes an amount greater than the input amount.

1. List of customers with all the debt entries will be given as input.
2. Each customer will have a field `owes` that records the total amount owed by the customer.
3. Find all customers who owes an amount greater than the given amount.
4. Combine all such debts and return that.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getEntries = ({ customers, amount }) => {
  // write your code here
}
</code>

<solution>
const getEntries = ({ customers, amount }) =>
  customers
    .filter(customer => customer.owes > amount)
    .reduce((allDebts, customer) => [...allDebts,...customer.debts],[]);
</solution>

<testcases>
<caller>
const entries = getEntries({ customers, amount });
console.log(JSON.stringify(entries, null, 2));
</caller>
<testcase>
<i>
const customers = [
  {
    name: "Alan",
    owes: 30000,
    debts: [
      {
        amount: 10000,
        date: "28-June-2020",
        customer: "Alan"
      },
      {
        amount: 20000,
        date: "30-June-2020",
        customer: "Alan"
      },
      {
        amount: 5000,
        date: "5-July-2021",
        customer: "Alan"
      }
    ]
  },
  {
    name: "Eric",
    owes: 60000,
    debts: [
      {
        amount: 30000,
        date: "28-June-2020",
        customer: "Eric"
      },
      {
        amount: 20000,
        date: "30-June-2020",
        customer: "Eric"
      },
      {
        amount: 10000,
        date: "5-July-2021",
        customer: "Eric"
      }
    ]
  },
  {
    name: "John",
    owes: 90000,
    debts: [
      {
        amount: 45000,
        date: "28-June-2020",
        customer: "John"
      },
      {
        amount: 25000,
        date: "30-June-2020",
        customer: "John"
      },
      {
        amount: 20000,
        date: "5-July-2021",
        customer: "John"
      }
    ]
  },
  {
    name: "Juan",
    owes: 95000,
    debts: [
      {
        amount: 35000,
        date: "28-June-2020",
        customer: "Juan"
      },
      {
        amount: 45000,
        date: "30-June-2020",
        customer: "Juan"
      },
      {
        amount: 15000,
        date: "5-July-2021",
        customer: "Juan"
      }
    ]
  }
];
const amount = 85000;
</i>
</testcase>
<testcase>
<i>
const customers = [
  {
    name: "Alan",
    owes: 30000,
    debts: [
      {
        amount: 10000,
        date: "28-June-2020",
        customer: "Alan"
      },
      {
        amount: 20000,
        date: "30-June-2020",
        customer: "Alan"
      },
      {
        amount: 5000,
        date: "5-July-2021",
        customer: "Alan"
      }
    ]
  },
  {
    name: "Eric",
    owes: 60000,
    debts: [
      {
        amount: 30000,
        date: "28-June-2020",
        customer: "Eric"
      },
      {
        amount: 20000,
        date: "30-June-2020",
        customer: "Eric"
      },
      {
        amount: 10000,
        date: "5-July-2021",
        customer: "Eric"
      }
    ]
  },
  {
    name: "John",
    owes: 90000,
    debts: [
      {
        amount: 45000,
        date: "28-June-2020",
        customer: "John"
      },
      {
        amount: 25000,
        date: "30-June-2020",
        customer: "John"
      },
      {
        amount: 20000,
        date: "5-July-2021",
        customer: "John"
      }
    ]
  },
  {
    name: "Juan",
    owes: 95000,
    debts: [
      {
        amount: 35000,
        date: "28-June-2020",
        customer: "Juan"
      },
      {
        amount: 45000,
        date: "30-June-2020",
        customer: "Juan"
      },
      {
        amount: 15000,
        date: "5-July-2021",
        customer: "Juan"
      }
    ]
  }
];
const amount = 50000;
</i>
</testcase>
<testcase>
<i>
const customers = [
  {
    name: "Alan",
    owes: 30000,
    debts: [
      {
        amount: 10000,
        date: "28-June-2020",
        customer: "Alan"
      },
      {
        amount: 20000,
        date: "30-June-2020",
        customer: "Alan"
      },
      {
        amount: 5000,
        date: "5-July-2021",
        customer: "Alan"
      }
    ]
  },
  {
    name: "Eric",
    owes: 60000,
    debts: [
      {
        amount: 30000,
        date: "28-June-2020",
        customer: "Eric"
      },
      {
        amount: 20000,
        date: "30-June-2020",
        customer: "Eric"
      },
      {
        amount: 10000,
        date: "5-July-2021",
        customer: "Eric"
      }
    ]
  },
  {
    name: "John",
    owes: 90000,
    debts: [
      {
        amount: 45000,
        date: "28-June-2020",
        customer: "John"
      },
      {
        amount: 25000,
        date: "30-June-2020",
        customer: "John"
      },
      {
        amount: 20000,
        date: "5-July-2021",
        customer: "John"
      }
    ]
  },
  {
    name: "Juan",
    owes: 95000,
    debts: [
      {
        amount: 35000,
        date: "28-June-2020",
        customer: "Juan"
      },
      {
        amount: 45000,
        date: "30-June-2020",
        customer: "Juan"
      },
      {
        amount: 15000,
        date: "5-July-2021",
        customer: "Juan"
      }
    ]
  }
];
const amount = 35000;
</i>
</testcase>
</testcases>
</codeblock>