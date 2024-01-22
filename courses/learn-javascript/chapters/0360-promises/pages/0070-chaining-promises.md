Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Adam Smith",
  balance: 100000,
}

const transferMoney = ({ amount, receiver }) => new Promise((resolve, reject) =>
  setTimeout(() => {
    if (amount > user.balance) {
      reject(new Error("Not enough balance"));
    } else {
      user.balance -= amount;
      resolve(`${amount} transferred to ${receiver}`);
    }
  }, 5000)
);

const getBalance = () => new Promise(resolve =>
  setTimeout(() => resolve(user.balance), 2000)
);

transferMoney({ amount: 50000, receiver: "Sam Smith" })
  .then(message => console.log(message))
  .catch(error => console.log(error.message));

getBalance()
  .then(balance => console.log(`The balance is ${balance}`));
</code>
</codeblock>

In the example above,
the intention was to
first transfer the money
and then
display the balance.
`transferMoney` takes longer to resolve
than `getBalance`.
Hence the message from `getBalance`
is displayed before the message from `transferMoney`.

We can use **chained promises**
to ensure two or more asynchronous functions
are executed in a particular order.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Adam Smith",
  balance: 100000,
}

const transferMoney = ({ amount, receiver }) => new Promise((resolve, reject) =>
  setTimeout(() => {
    if (amount > user.balance) {
      reject(new Error("Not enough balance"));
    } else {
      user.balance -= amount;
      resolve(`${amount} transferred to ${receiver}`);
    }
  }, 5000)
);

const getBalance = () => new Promise(resolve =>
  setTimeout(() => resolve(user.balance), 2000)
);

transferMoney({ amount: 50000, receiver: "Sam Smith" })
  .then(message => {
    console.log(message);
    return getBalance();
  })
  .then(balance => console.log(`The balance is ${balance}`))
  .catch(error => console.log(error.message));
</code>
</codeblock>

In the above example,

- Once the `Promise` returned by
  `transferMoney({ amount: 50000, receiver: "Sam Smith" })`
  is resolved,
  the first `.then()` displays a message
  and the returns `getBalance`.

- Since `getBalance` is a `Promise`,
  the second `.then()` will only be executed
  once `getBalance` is resolved.

- Once the `Promise` returned by
  `getBalance` is resolved,
  the second `.then()` displays the balance.

If an error was thrown in any of the
asynchronous operations,
`.catch()` would be executed.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Adam Smith",
  balance: 100000,
}

const transferMoney = ({ amount, receiver }) => new Promise((resolve, reject) =>
  setTimeout(() => {
    if (amount > user.balance) {
      reject(new Error("Not enough balance"));
    } else {
      user.balance -= amount;
      resolve(`${amount} transferred to ${receiver}`);
    }
  }, 5000)
);

const getBalance = () => new Promise(resolve =>
  setTimeout(() => resolve(user.balance), 2000)
);

transferMoney({ amount: 150000, receiver: "Sam Smith" })
  .then(message => {
    console.log(message);
    return getBalance();
  })
  .then(balance => console.log(`The balance is ${balance}`))
  .catch(error => console.log(error.message));
</code>
</codeblock>

In the example given above,
`transferMoney({ amount: 150000, receiver: "Sam Smith" })`
gets rejected.
Because of that,
both `.then()` are skipped
and
`.catch()` gets executed.
