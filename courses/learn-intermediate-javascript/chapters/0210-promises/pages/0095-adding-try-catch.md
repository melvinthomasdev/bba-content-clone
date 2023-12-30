In the example shown in the last lesson,
we are not handling any errors.
We need to use `try...catch`
to catch any errors that may occur.

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
  try {
    const message = await transferMoney({ amount: 150000, receiver: "Sam Smith" });
    console.log(message);
    const balance = await getBalance;
    console.log(`The balance is ${balance}`);
  } catch (error) {
    console.log(error.message);
  }
}

performTransaction();
</code>
</codeblock>

The `performTransaction` function uses `await`
within a `try` block to handle any potential
errors thrown by the `transferMoney`
and `getBalance` promises.

**Note:** It is absolutely necessary
to catch errors that can be thrown
by the asynchronous functions
using `try...catch`.
