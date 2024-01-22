Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = async ({ to, amount }) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (amount > 5000) {
        reject("Limit exceeded");
      } else {
        resolve(`Transferring ${amount} to ${to}`);
      }
    }, 2000);
  });
};

const performMoneyTransfer = async () => {
  const message = await transferMoney({ to: "Sam", amount: 1000 });
  console.log(message);
  console.log("Transfer Complete");
};

performMoneyTransfer();
</code>
</codeblock>

In the above example, `transferMoney` is an
async function representing a fund transfer,
and `performMoneyTransfer` uses `async/await`
to handle it.
The transfer occurs only if the amount does
not exceed the specified limit.

Consider the example given below:

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

const getBalance = new Promise(resolve =>
  setTimeout(() => resolve(user.balance), 2000)
);

const performTransaction = async () => {
  const message = await transferMoney({ amount: 50000, receiver: "Sam Smith" });
  console.log(message);
  const balance = await getBalance;
  console.log(`The balance is ${balance}`);
}

performTransaction();
</code>
</codeblock>

In the example given above,
in the `performTransaction` function,

- `await transferMoney({ amount: 50000, receiver: "Sam Smith" })`
  is executed first.
  The string returned by the `resolve()`
  inside `transferMoney`,
  is stored in the `message` variable.
  Which is then displayed using `console.log()`.

- Then, `await getBalance` gets executed
  and the balance amount returned by
  the `resolve()` inside `getBalance`,
  is stored in the `balance` variable.
  Which is then displayed using `console.log()`.

**This code is cleaner
and
easier to understand.
Using `async/await` is preferred
over `.then()` and `.catch()`.**
