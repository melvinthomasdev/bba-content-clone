Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
async function showGreeting() {
  return "Hello World";
}

console.log(showGreeting());
</code>
</codeblock>

When we append the `async` keyword to a function,
it automatically wraps the return value in a Promise.

<codeblock language="javascript" type="lesson">
<code>
async function showGreeting() {
  return "Hello World";
}

showGreeting().then( result => {
  console.log(result);
})
</code>
</codeblock>

We can use the `.then()` method to
handle the result.

Adding `await` makes the code
to wait for asynchronous task
to resolve before proceeding further.
Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
function loadBalance() {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve("You have $5000 in your account.");
    }, 2000);
  });
}

async function balanceEnquiry() {
  console.log("Welcome to ABC Bank ATM");
  const balance = await loadBalance();
  console.log(balance);
  console.log("Thank you for Banking with us.");
}

balanceEnquiry();
</code>
</codeblock>

In the above example, the `await` statement
ensures the code waits for the `loadBalance`
operation to complete before proceeding further.
It pauses the execution of the `balanceEnquiry`
function until the `loadBalance` Promise is resolved.
This ensures the balance is displayed before
thanking the customer.

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

transferMoney({ amount: 50000, receiver: "Sam Smith" })
  .then(message => {
    console.log(message);
    return getBalance;
  })
  .then(balance => console.log(`The balance is ${balance}`))
  .catch(error => console.log(error.message));
</code>
</codeblock>

In the example given above,
we use chaining promises to ensure
two asynchronous operations are performed
in a particular order.
However the above code is harder to understand
and
can be made cleaner using `async/await`.

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
we invoke a function `performTransaction`
that has the `async` keyword
before the definition of the function.
We need to define a function
with the `async` keyword,
if we are going to use
`await` within that function.

Adding `await` before a `Promise`
ensures that the execution will only
continue after the `Promise`
is either resolved or rejected.

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
