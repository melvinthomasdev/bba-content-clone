Inline functions are extremely convenient to use when declaring and passing
functions to event handlers such as `onClick`.

It is best used when your function contains a single expression as shown:

```jsx
import { useState } from "react";

const ClickerButton = () => {
  const [clicked, setClicked] = useState(false);

  return <button onClick={() => setClicked(true)}>Click Here!</button>;
};
```

However, if the function contains multiple lines, it is better to define a
function outside the JSX and pass it to the event handler as a callback.

For example, if the function looks like this:

```jsx
import { useState } from "react";
import { anotherFunction1, anotherFunction2 } from "./utils";

const ClickerButton = () => {
  const [userDetails, setUserDetails] = useState({});

  return (
    <button
      onClick={() => {
        setClicked(true);
        anotherFunction1();
        anotherFunction2();
      }}
    >
      Click Here
    </button>
  );
};
```

It is better to extract the onClick function into a separate function like this:

```jsx
import { useState } from "react";
import { anotherFunction1, anotherFunction2 } from "./utils";

const ClickerButton = () => {
  const [userDetails, setUserDetails] = useState({});

  const handleClick = () => {
    setClicked(true);
    anotherFunction1();
    anotherFunction2();
  };

  return <button onClick={handleClick}>Click Here</button>;
};
```
