Look at the code given below:

<Editor lang="javascript">
<code>
// Project Cost Calculator - a simple add function
const addCost = (costOfA, costOfB) => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(costOfA + costOfB);
    }, 2000);
  })
}

// Calculation using chained promises
const projectCostPromised = addCost(12, 12)
  .then(previousTotalCost => {
    return addCost(previousTotalCost, 24);
}).then(locationChangeCostIncluded => {
    return addCost(locationChangeCostIncluded, 36);
});

// Calculation using Async Await
const projectCost = async () => {
  const previousTotalCost = await addCost(12, 12);
  const locationChangeCostIncluded = await addCost(previousTotalCost, 24);
  const manpowerChangeCostIncluded = await addCost(locationChangeCostIncluded, 36);
  return manpowerChangeCostIncluded;
}

projectCostPromised.then(result => console.log(result));
projectCost().then(result => console.log(result));
</code>
</Editor>

While using promises, we see situations
like the following when we have a chain
of promises and our code starts to look
ugly. Async/Await is a simpler and cleaner
way to structure our code.

In the example given above, we have
created the same code in two different ways.
Once with promises, and once with async, await.
You can see how clean our work
looks with async await.

We just append the `async` in front of
a function that we know
will return a Promise.

Combine the `async` with the
`await` keyword.
Inside the `async` function,
put the `await` keyword in
front of a function
that is based on a promise.
That way, we can
pause our code on that line until
the promise fulfills. After this,
we can return the result.
