Define the function `displayEligibility`
with one parameter - `user`.
If `user.age` is not defined,
stop further execution of the function.
If the value of `user.age` is **18** or higher,
display **You are eligible**
and
increment the value of `eligibleUsersCount`.
Otherwise, if the value is less than **18**,
display **You are not eligible** in the console.

For example:
```js
Input:
user1 = {
  name: "Oliver Smith",
  age: 40,
}

user2 = {
  name: "Sam Smith",
  age: 20,
}

Output:
"You are eligible"
"You are eligible"
2
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
let eligibleUsersCount = 0;

const displayEligibility = ;

const user1 = {
  name: "Oliver Smith",
  age: 32,
};

const user2 = {
  name: "Sam Smith",
  age: 12,
};

displayEligibility(user1);

displayEligibility(user2);

console.log(eligibleUsersCount);
</code>

<solution>
let eligibleUsersCount = 0;

const displayEligibility = user => {
  if (!user.age) return;

  if (user.age < 18) {
    console.log("You are not eligible");
    return;
  }

  console.log("You are eligible");
  eligibleUsersCount++;
};

const user1 = {
  name: "Oliver Smith",
  age: 32,
};

const user2 = {
  name: "Sam Smith",
  age: 12,
};

displayEligibility(user1);

displayEligibility(user2);

console.log(eligibleUsersCount);
</solution>
</codeblock>
