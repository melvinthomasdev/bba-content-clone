For a lucky draw, choose the winner whose ticket number is divisible by 113. If there is more than 1, then try 251, 376 and 401 in that order.

1. Assuming there will always be one winner ticket ID that matches the above mentioned logic.

For example:
```js
Input:
const ticketLot = [
  {
    id: 6006,
    name: 'Lao Xun',
  },
  {
    id: 1034,
    name: 'Linh Tran',
  },
  {
    id: 01,
    name: 'Chinua Achebe',
  }
];

Output:
6006
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const chooseWinner = ticketLot => {
  // your code here
}
</code>

<solution>
const chooseWinner = ticketLot => {
  const divisorFrequency = [113, 251, 376, 401];
  let winner = "";
  divisorFrequency.forEach(divisor => {
    if (winner) return;

    let winners = ticketLot.filter(ticket => ticket.id % divisor === 0);
    if (winners && winners.length === 1)
      winner = winners[0].id;
  });
  return winner;
};
</solution>

<testcases>
<caller>
console.log(chooseWinner(ticketLot));
</caller>
<testcase>
<i>
const ticketLot = [
  {
    id: 8421,
    name: 'Kendall Gordon',
  },
  {
    id: 1356,
    name: 'Chase Walton',
  },
  {
    id: 2599,
    name: 'Nadia Ali',
  }
];
</i>
</testcase>
<testcase>
<i>
const ticketLot = [
  {
    id: 2825,
    name: "Kendall Gordon"
  },
  {
    id: 2147,
    name: "Chase Walton"
  },
  {
    id: 3765,
    name: "Thomas Bond"
  },
  {
    id: 2761,
    name: "Waldo Lynch"
  },
  {
    id: 3384,
    name: "Margot Stanley"
  },
  {
    id: 4010,
    name: "Maria Dawson"
  },
  {
    id: 4411,
    name: "Daley Ferguson"
  }
];
</i>
</testcase>
<testcase>
<i>
const ticketLot = [
  {
    id: 2263,
    name: 'Chinua Achebe',
  },
  {
    id: 251,
    name: 'Linh Tran',
  },
  {
    id: 1212,
    name: 'Sam Smith',
  },
  {
    id: 3145,
    name: 'Eve Smith',
  }
];
</i>
</testcase>
<testcase>
<i>
const ticketLot = [
  {
    id: 6006,
    name: 'Lao Xun',
  },
  {
    id: 1034,
    name: 'Linh Tran',
  },
  {
    id: 113,
    name: 'Sam Smith'
  }
  {
    id: 01,
    name: 'Chinua Achebe',
  }
];
</i>
</testcase>
</testcases>
</codeblock>
