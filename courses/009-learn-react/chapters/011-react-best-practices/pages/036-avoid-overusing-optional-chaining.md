## When to use optional chaining?

We can use optional chaining or `?.` operator when we are not sure if certain properties will be there in the object or not. If the object contains the required property it will return the value of that property. But if the object does not contain the required property then the execution of that statement will stop immediately and `undefined` will be returned.

For example, consider an object like so:

```js
const candidate = {
  name: "Oliver Smith",
  location: "India",
  education: {
    college: {
      name: "Abc Institute",
      course: "B.Tech",
      score: "95",
    },
  },
  //some other values
};
```

Now we can access the college name of the candidate using dot operator like so:

```js
candidate.education.college.name;
```

Let's say educational details are optional. So there can be a case when the `candidate` object does not have any of the properties defined in the above example then it will give an error. The app will break with a `TypeError` stating "undefined is not an object".

One solution for this problem is to use multiple `if` or `&&` conditions. But a better and cleaner solution is using optional chaining.

In the above mentioned object we can access the college name using optional chaining like so:

```js
candidate?.education?.college?.name;
```

Now there will be no error in the code even if any of the above used properties like education, college, or name is not defined. If any of the properties are non-existent, then the optional chain immediately returns `undefined` without continuing further along the chain.

## Don't overuse optional chaining

We should be careful while using optional chaining. If we overuse the optional chaining then there can be a case when an actual error gets skipped and may end up concealing relevant error messages. Optional chaining can delay the underlying error but can not solve it which is not a good practice.

We have also overused the optional chaining in the above example in part `college?.name`. If college details are present there has to be a name for the college. If we get some error after removing optional chaining from the `college?.name` that means there are some data entries where the college's name is not present. Adding optional chaining in `college.name` will remove the error but it will suppress the underlying issue that why there are college details without the name.

So the correct example will be like so:

```js
candidate?.education?.college.name;
```

Optional chaining should only be used when we are sure about the fact that the value can be non-existent. Otherwise, the optional chain can give the wrong info to the one who reads the code. From a reader's perspective if we have used optional chaining that means that the value is optional and can be skipped by the user.

Let's consider another example where we have a `user` object which is essentially the currently logged in user. We have a property called `auth_token` which points out if the user is legit or not. We use this `auth_token` for the whole app to work as intended. If someone decides to optional chain it and subdue the errors, then we, the developers, are missing out on the edge cases where `auth_token` can be `null`. In the production environment it's important to catch these errors. If we silence these errors then [Honeybadger](https://www.honeybadger.io/) or other tools, will not end up creating issues in Github to notify us about such errors happening in production environment.

So in simple terms, if we overuse optional chaining and subdue all the errors, then we will miss out on the specific edge cases where the value becomes empty, where it's not supposed to become empty. We optional chain, when we are sure that there is a scenario in the business aspect of our application, where value can become undefined.

**To conclude, let the app break due to the lack of usage of an optional chain, so that we can fix the root cause of the issue. Use optional chaining only with the values which we are sure to be non-existent**.

For more details please refer to:

- [Please don't overuse optional chaining](https://blog.agney.dev/overusing-optional-chaining/)

- [How to Use Optional Chaining in JavaScript?](https://www.freecodecamp.org/news/javascript-optional-chaining/)
