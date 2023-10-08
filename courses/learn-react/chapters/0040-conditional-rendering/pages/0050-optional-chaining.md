The optional chaining operator `?.` can be used when we are not sure if an object contains a certain property or not.

If the object contains the required property, it will return the value of that property. Otherwise, it stops the execution of that statement and returns `undefined`.

For example, consider a `candidate` object that contains a nested object education:

```js
const candidate = {
  name: "Oliver Smith",
  location: "India",
  college: {
    name: "Abc Institute",
    course: "B.Tech",
    score: "95",
  },
};
```

If you need to access the college name, you can use the dot operator like this: `candidate.college.name`. But let's say the `college` property is optional, thus, trying to access `college.name` could give an error stating "undefined is not an object".

While the traditional approach is to use multiple `if` or `&&` conditions, a cleaner one is to use optional chaining like this:

`candidate.college?.name;`

Now, even if the `college` property doesn't exist, then the optional chaining operator just returns `undefined` without continuing further along the chain to `name`.

## Don't overuse optional chaining

While optional chaining is a convenient tool, keep in mind that optional chaining should only be used when we are sure that the value can be non-existent. Otherwise, this operator can hide errors as they keep passing along without triggering any error messages. This is not a good practice.

In the example shown above, if every college **must** have a name, writing `candidate.college?.name;` is wrong as it implies there exist some college(s) without a name. We should change it back to `candidate.college.name;` so that it triggers an error if a college without a name pops up.

In a less trivial example, if a user's `auth_token` is part of an optional chain, anyone can use that feature by pretending to be logged in with an `auth_token` of `null`.

If we silence these errors in a production environment, then [Honeybadger](https://www.honeybadger.io/) or other monitoring tools will not notify us of possible breakages.

If you'd like to learn more about this operator, check out [this article by FreeCodeCamp](https://www.freecodecamp.org/news/javascript-optional-chaining/) on it.

