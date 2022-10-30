Destructuring is an easy way of extracting specific keys from an object.
Destructuring can come in handy in several places like extracting the keys from
prop or while setting state.

Consider the following example:

```jsx
import React from "react";

const Display = props => {
  return <p>Hello {props.name}</p>;
};
```

In the above component, the props could have been destructured like so:

```jsx
import React from "react";

const Display = ({ name }) => {
  return <p>Hello {name}</p>;
};
```

Another use case of destructuring can be while updating an object in state.
Consider a scenario where you need to update only specific keys in an object in
the state. Consider the following code snippet:

```jsx
import React, { useState } from "react";

const Display = () => {
  const [user, setUser] = useState({ name: "Oliver", age: 25, location: "IN" });

  const updateUserAge = () => {
    setUser(user => ({ ...user, age: 20 }));
  };

  const { name, age, location } = user;

  return (
    <p>
      {name} is {age} years old.
    </p>
  );
};
```

Keep in mind that the positioning of the spread operator in the object is very
important while destructuring if there are duplicate keys. Let us understand
this with the help of an example:

```javascript
let user = {
  name: "Oliver",
  age: 25,
};

user = { name: "Eve", ...user, age: 20 };

console.log(user); // { name: "Oliver", age: 20 }
```

In the above example, we destructured the user object and updated the age. We
also attempted to update the name but that wasn't successful because a duplicate
name key exists in the user object. Since the `name` key/value pair was placed
before the spread operator it couldn't overwrite the value of name key inside
the user object. Whereas `age` key/value pair was placed after the spread
operator hence the `age` was updated.

Therefore the positioning of spread operator is important if a duplicate key
exists.

Consider a scenario where you want to update the user's name only if it doesn't
exist. In that case you could place the spread operator after the `name`
key/value pair and user's name will be updated if `user.name` is undefined. If
`user.name` returns a valid value then the old value will be used. Bear in mind
that in this case `null` is also valid.

```javascript
let user = {
  age: null,
};

console.log(user.name); // undefined

user = { name: "Eve", age: 25, ...user };

console.log(user); // { name: "Eve", age: null }
```

Destructuring also lets you rename the destructured key like so:

```jsx
const { name: userName, age, location } = user;

return (
  <p>
    {userName} is {age} years old.
  </p>
);
```

In the above code, we have renamed or you could say that we have declared an
alias userName for name.
