As explained in previous chapters, every state must be held by the highest parent component in the stack that requires access to the state so that it can be passed down as necessary. This leads to a problem called "prop drilling" when we have many nested components.

Prop drilling looks like this:

```jsx
import { useState } from "react";

const Component1 = () => {
  const [user, setUser] = useState("Oliver Smith");
  return(
    <>
      <h1>{`Greetings from the top level component, ${user}`}</h1>
      <Component2 user={user} />
    </>
  )
}

const Component2 = ({user}) => <Component3 user={user} />

const Component3 = ({user}) => <Component4 user={user} />

const Component4 = ({user}) =>
  <h2>{`Greetings from the bottom level component, ${user}`}</h2>
```

In the trivial example above, the prop `user` had to pass through 2 components that didn't even utilize the prop before reaching its target `Component4`.

The easiest way to solve prop drilling is by simply moving the state definition to where it's needed and thus avoiding the need to pass it along.

However, due to the top-level `Component1` also needing the `user` variable, we cannot move the state definition to the bottom-level `Component4`. This is where the Context API comes in handy.

If you wish to see a more detailed explanation of prop drilling, [this video by Deeecode](https://www.youtube.com/watch?v=QLO64jkGkRg) explains it well.

## Creating a Context

To create a context, you must Import `createContext` and initialize it like this:

```jsx
import { useState, createContext } from "react";

const UserContext = createContext()
```

then wrap the child components in the Context Provider and supply the state value:

```jsx
const Component1 = () => {
  const [user, setUser] = useState("Oliver Smith");

  return (
    <UserContext.Provider value={user}>
      <h1>{`Greetings from the top level component, ${user}`}</h1>
      <Component2 />
    </UserContext.Provider>
  );
}
```

Now all components in the component tree should have access to this user context.

## Using a Context

To use the value of a Context in a child component, we can use the `useContext` hook as shown below:

```jsx
import { useState } from "react";

const UserContext = createContext();

const Component1 = () => {
  const [user, setUser] = useState("Oliver Smith");
  return(
    <UserContext.Provider value={user}>
      <h1>{`Greetings from the top level component, ${user}`}</h1>
      <Component2 />
    </UserContext.Provider>
  )
}

const Component2 = () => <Component3 />

const Component3 = () => <Component4 />

const Component4 = () => {
  const user = useContext(UserContext);
  return <h2>{`Greetings from the bottom level component, ${user}`}</h2>
}
```

As shown above, we sidestepped prop drilling through `Component2` & `Component3` and instead passed it straight from `Component1` to `Component4`.