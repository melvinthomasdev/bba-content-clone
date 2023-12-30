Adding `await` makes the code
to wait for the asynchronous task
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

Let's look at another example:

<codeblock language="javascript" type="lesson">
<code>
function fetchUserData(userId) {
  return new Promise((resolve) => {
    setTimeout(() => {
      const userData = {
        id: userId,
        name: "Sam Smith",
        age: 25,
      };
      resolve(userData);
    }, 2000);
  });
}

async function displayUserInfo(userId) {
  console.log("Fetching user data...");
  const userData = await fetchUserData(userId);
  console.log(`User ID: ${userData.id}`);
  console.log(`Name: ${userData.name}`);
  console.log(`Age: ${userData.age}`);
}

displayUserInfo(123);
</code>
</codeblock>

In the above example, `fetchUserData` simulates
an asynchronous API call for user data,
and `displayUserInfo` utilizes `async/await`
for handling the asynchronous operation.
