## Prefer guard clauses over nested conditional statements

Nested conditional statements can interfere with code readability. For example,
consider the following lines of code:

```jsx
import React, { useState } from "react";

const Display = () => {
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState(null);

  const getResult = data => {
    if (!loading) {
      let result;
      if (data) {
        result = "Data found!";
      } else {
        result = "Data not found!";
      }
      return result;
    } else {
      return "Loading!";
    }
  };

  return <p>{getResult()}</p>;
};

export default Display;
```

In the above code, nested conditional statements have made the code somewhat
difficult to read. A good solution is to use guard clauses. Guard clauses are
conditional statements that evaluate a condition and based on the result the
execution stops at the guard statement and a result is returned. Let's
understand this with the help of the following example:

```jsx
import React, { useState } from "react";

const Display = () => {
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState(null);

  const getResult = data => {
    if (loading) return "Loading!";

    if (data) return "Data found!";

    return "Data not found!";
  };

  return <p>{getResult()}</p>;
};

export default Display;
```

In the above code, each `if` statement is a guard block that evaluates a condition and returns a value based on that. Add a blank line after each guard clause to explicitly show that the statement exits the function scope.

Let's consider one more example. We have a user object which has `firstName` and `lastName` properties. We want to combine the `firstName` and `lastName` with a space if both values are present. If only one of them is present then just return that value. If none of the values are present return an empty string.

The code will look like this:

```js
const getName = user => {
  if (user) {
    const { firstName, lastName } = user;
    if (!firstName && !lastName) {
      return "";
    } else {
      const name =
        firstName && lastName
          ? `${firstName} ${lastName}`
          : firstName || lastName;
      return name;
    }
  } else {
    return "";
  }
};
```

We can improve the above mentioned `getName` function with guard clauses. We can use multiple guard clauses to exit early and keep the core logic towards the end of the function. The updated code will look like this:

```js
const getName = user => {
  if (!user) return "";

  const { firstName, lastName } = user;
  if (!firstName && !lastName) return "";

  const name =
    firstName && lastName ? `${firstName} ${lastName}` : firstName || lastName;
  return name;
};
```

## Using && over ternary

Consider the following piece of code:

```jsx
import React, { useState } from "react";

const Display = () => {
  const [loading, setLoading] = useState(false);

  return <p>{loading ? "Data" : null}</p>;
};

export default Display;
```

In the above code we have used a ternary operator to check if `loading` is true
and based on that returning a value. Rather than doing so, we refactor the code
like this:

```jsx
import React, { useState } from "react";

const Display = () => {
  const [loading, setLoading] = useState(false);

  return <p>{loading && "Data"}</p>;
};

export default Display;
```

In the above code, `&&` operator will return the first false value it encounters
otherwise it will return the last value in the expression. Hence if `loading` is
false then the value returned will be false. If not then `Data` will be
returned.

## if/else vs ternary operators

If/else statements and ternary operators are both used for writing conditional
statements. However one should not be substituted with another. For example,
ternary operators should be used in the following scenarios:

- If you're initializing a variable conditionally, or working out which value to
  use, then ternary operators should be used.

- When the operation that needs to be performed conditionally doesn't span
  across multiple lines. In such a case it is better to use an if/else
  statement.

If/else statements should be used when you want to execute a function or perform
multiple operations.

For example:

```javascript
const day = "Sunday";
// good
const typeOfDay =
  day === "Sunday" || day === "Saturday" ? "weekend" : "weekday";

// bad
let typeOfDay;
const day = "Sunday";
if (day === "Sunday" || day === "Saturday") {
  typeOfDay = "Weekend";
} else {
  typeOfDay = "Weekday";
}

// example for when to use "if" statement
const getSquare = num => num ** 2;
const num = 10;

// good
if (num < 2) getSquare(num);

// bad
num < 2 ? getSquare(num) : null;
```

Another mistake you should avoid is returning a boolean value while using
ternary operators. For example:

```javascript
const num = 20;
// bad
const isEven = num % 2 === 0 ? true : false;

// good
const isEven = num % 2 === 0;
```

In the above example, `num % 2 === 0` will itself result in a boolean value
hence using ternary operators is redundant.

## Avoid nesting ternary operators

Nesting ternary operators is a bad practice. It leads to poor code readability. For example:

```jsx
return (
  <>
    {isItemsLoading ? (
      <PageLoader />
    ) : (
      <SomeParentComponent>
        {isEmpty(items) ? (
          <NoItemsFound />
        ) : (
          items.map(item => <Item {...item} />)
        )}
      </SomeParentComponent>
    )}
  </>
);
```

It is better to use an if/else statement instead of nesting ternary operators, like this:

```jsx
if (isItemsLoading) {
  return <PageLoader />;
}

return (
  <SomeParentComponent>
    {isEmpty(items) ? <NoItemsFound /> : items.map(item => <Item {...item} />)}
  </SomeParentComponent>
);
```

Nested ternaries can be used in JSX if it improves the code readability in comparison with other approaches. It should not be used in plain JS unless there is some exceptional case that demands it.

The following is an example where nesting ternary operators is acceptable since each operation is just a single line.

```jsx
<SomeParentComponent>
  {typeIs(SINGLE_CHOICE) ? (
    <SingleChoiceQuestion {...singleChoiceProps} />
  ) : typeIs(MULTI_CHOICE) ? (
    <MultiChoiceQuestion {...multiChoiceProps} />
  ) : typeIs(SHORT_ANSWER) ? (
    <ShortAnswerQuestion {...shortAnswerProps} />
  ) : null}
</SomeParentComponent>
```
