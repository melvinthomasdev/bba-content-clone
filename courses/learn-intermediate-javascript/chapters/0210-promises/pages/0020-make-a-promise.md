Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = ({ to, amount, callback }) => {
  setTimeout(() => {
    console.log(`Transferring ${amount} to ${to}`);
    callback();
  }, 5000);
}

const onSuccess = () => console.log("Transfer Complete");

transferMoney({
  to: "Sam",
  amount: 10000,
  callback: onSuccess
});
</code>
</codeblock>

In the above example,
we use the callback method
to execute a function after
the completion of
an asynchronous operation.

The code is not clean
and
is hard to understand.
In such situations,
we can use a `Promise`.

A `Promise` returns one of two states
upon the completion of an operation.
It either returns **resolved**,
which means the operation was completed
without any errors.
Or it returns **rejected**,
which means that the operation
threw an error on execution.

Let's create a `Promise` for the
`transferMoney` function from the above example,
without the callback function.

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = ({ to, amount }) => new Promise(resolve => {
  setTimeout(() => {
    console.log(`Transferring ${amount} to ${to}`)
    resolve();
  }, 5000);
});

transferMoney({ to: "Sam", amount: 10000 });
</code>
</codeblock>

In the example given above,
the function `transferMoney`
returns a `Promise`.
We pass a function as argument
to `new Promise()`.
This function can accept two parameters.
The first parameter of that function
is `resolve`.

Note that all of the below implementations
are the same:

<codeblock language="javascript" type="exercise" showRunCodeButton="false" testMode="fixedInput">
<code>
const moneyResolver = resolve => {
  // handle promise
};
const transferMoney = ({ to, amount }) => new Promise(moneyResolver);

// same as above implementation
const transferMoney = ({ to, amount }) => new Promise(resolve => {
  // handle promise
});
</code>
</codeblock>

The `resolve` function should be invoked when you
want the `Promise` to
return the `resolved` state,
which is the successful state.

Now, we need to invoke the
`onSuccess` function
when the `Promise` is resolved.
We can use `.then()` for this.

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = ({ to, amount }) => new Promise(resolve => {
  setTimeout(() => {
    console.log(`Transferring ${amount} to ${to}`)
    resolve();
  }, 5000);
});

const onSuccess = () => console.log("Transfer Complete");

transferMoney({ to: "Sam", amount: 10000 }).then(onSuccess);
</code>
</codeblock>

In the example given above:

- `transferMoney({ to: "Sam", amount: 10000 })` is invoked.
  It returns a `Promise` that will resolve
  once the transfer is done.

- When the `Promise` is resolved,
  the function passed as argument
  to `.then()` is executed,
  i.e., `onSuccess` is executed.

Let's modify the `transferMoney` function
to return the rejected state,
if the amount is higher than `5000`.
The second parameter of the
function argument passed to
`new Promise` is `reject`.
It should be invoked when you
want the `Promise` to
return the `rejected` state.

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = ({ to, amount }) =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      if (amount > 5000) {
        console.log("Limit exceeded");
        reject();
      } else {
        console.log(`Transferring ${amount} to ${to}`);
        resolve();
      }
    }, 5000);
  });

transferMoney({ to: "Sam", amount: 10000 })
  .then(() => console.log("Transfer Complete"));
</code>
</codeblock>

In the example given above,
the function in `.then()`
was not executed because
the `Promise` was rejected.

We can use `.catch()` to
perform some action when
the a `Promise` is rejected.

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = ({ to, amount }) =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      if (amount > 5000) {
        console.log("Limit exceeded");
        reject();
      } else {
        console.log(`Transferring ${amount} to ${to}`);
        resolve();
      }
    }, 5000);
  });

transferMoney({ to: "Sam", amount: 10000 })
  .then(() => console.log("Transfer Complete"))
  .catch(() => console.log("Transfer could not be processed"));
</code>
</codeblock>

In the example given above,
since the `amount` is greater than `5000`,
the Promise is rejected.
Hence, the function passed to `.then()`
is not executed.
The function passed to `.catch()`
is executed instead.

If we pass an argument to a `resolve()` call,
that argument can be accessed
by the function passed as argument to `.then()`.
Similarly, an argument to a `reject()` call,
can be accessed by the function
passed as argument to `.catch()`.

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = ({ to, amount }) =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      if (amount > 5000) reject("Limit exceeded");
      else resolve(`Transferring ${amount} to ${to}`);
    }, 5000);
  });

transferMoney({ to: "Sam", amount: 10000 })
  .then(message => {
    console.log(message);
    console.log("Transfer Complete");
  })
  .catch(error => {
    console.log(error);
    console.log("Transfer could not be processed");
  });
</code>
</codeblock>

In the example given above,
since the value of `amount`
is higher than `5000`,
the Promise is rejected
and
the error message **"Limit exceeded"**
is passed as argument to `reject()`.
This message is then accessed by the
function passed as argument in `.catch()`
and
will get displayed using `console.log`.

In the example given above,
if we change the value of `amount`
to a value lower than `5000`,
the Promise will get resolved
and a message will be passed to `resolve()`.
This message will then get accessed by
function passed as argument in `.then()`
and
will get displayed using `console.log`.

The usage of `.then()` and `.catch()`
is not preferred as it leads to
writing code that can be hard to understand.
We'll be taking a look at the preferred method
of handling asynchronous functions
towards the end of this section.
