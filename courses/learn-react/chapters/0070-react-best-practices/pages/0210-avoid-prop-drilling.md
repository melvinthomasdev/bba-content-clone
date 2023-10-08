## Prop drilling

In React data is passed down from parent components to child components through
props. Prop drilling is a situation when the data is passed through multiple
level of components only to be required in the last component in the hierarchy.

For example:

```jsx
const Main = () => {
  const [user, setUser] = useState({});

  return <Header user={user} />;
};

const Header = ({ user }) => {
  <Navbar user={user} />;
};

const Navbar = ({ user }) => {
  <h2>{user.name}</h2>;
};
```

In the above example, `user` is only required in the `Navbar` component but it
had to be passed down through the `Header` component. It is still fine in the
above example because the data was only passed through one component before the
it was consumed in the `Navbar` component. The issue intensifies when the prop
needs to be passed down through multiple levels in the component tree.

**Once again we stress that passing props down one component level is fine. That
shouldn't be considered as prop drilling.**

## Using React context API

Prop drilling can be avoided using the React context API. Context API provides a
way to share data between components without having to explicitly pass props
through every level of the component tree.

You can create a file called `user.js` inside the `src/contexts` directory and
add the following lines of code inside the file:

```jsx
import React, { useState, createContext, useContext } from "react";
import PropTypes from "prop-types";

const UserStateContext = createContext();
const UserDispatchContext = createContext();
const initialState = { user: null };

const UserProvider = ({ children }) => {
  const [state, setState] = useState(initialState);

  return (
    <UserStateContext.Provider value={state}>
      <UserDispatchContext.Provider value={setState}>
        {children}
      </UserDispatchContext.Provider>
    </UserStateContext.Provider>
  );
};

const useUserState = () => {
  const context = useContext(UserStateContext);
  if (context === undefined) {
    throw new Error("useUserState must be used within a UserProvider");
  }
  return context;
};

const useUserDispatch = () => {
  const context = useContext(UserDispatchContext);
  if (context === undefined) {
    throw new Error("useUserDispatch must be used within a UserProvider");
  }
  return context;
};

const useUser = () => {
  return [useUserState(), useUserDispatch()];
};

UserProvider.propTypes = {
  children: PropTypes.node,
};

export { UserProvider, useUserState, useUserDispatch, useUser };
```

The above code depicts the use of React context API which provides elegant means
to set and consume the user state inside any component without having to pass
the user as a prop to that component.

`UserProvider` is the context provider component. It wraps the child components
so that the child components subscribe to the context and then the context is
available to be consumed inside the child components. Note that `UserProvider`
is in PascalCase as it is ultimately a component.

`useUserState` component is a custom hook built on top of the `useContext` hook.
Calling this hook returns the value stored in the context.

`useUserDispatch` is a custom hook built on top of the `useContext` hook.
Calling this hook returns a setter function which can be used to update the
value of the context.

`useUser` is a custom hook which returns an array where the first element is
`useUserState` custom hook's return value and the second element is the
`useUserDispatch` custom hook's return value.

## Coupling contexts with reducers

Sometimes the state inside the context can be complex. In such a case it is
better to use the `useReducer` hook instead of the `useState` hook for state
management. `useReducer` is usually preferable over useState when you have a
state logic that involves multiple sub-values or when the next state depends on
the previous one.

Combining the `useReducer` and `useContext` hook is a good alternative to state
management libraries such as `Redux`.

Declare a `userReducer` function in the `src/reducers` directory like this:

```jsx
const userReducer = (state, { type, payload }) => {
  switch (type) {
    case "SET_USER": {
      return {
        user: payload.user,
      };
    }
    default: {
      throw new Error(`Unhandled action type: ${type}`);
    }
  }
};

export default userReducer;
```

To use a reducer for the `user.js` context, update the `user.js` context like
so:

```jsx{5,11,13}
import React, { useReducer, createContext, useContext } from "react";

import PropTypes from "prop-types";

import userReducer from "reducers/user";

const UserStateContext = createContext();
const UserDispatchContext = createContext();
const initialState = { user: null };

const UserProvider = ({ children }) => {
  const [state, dispatch] = useReducer(userReducer, initialState);

  return (
    <UserStateContext.Provider value={state}>
      <UserDispatchContext.Provider value={dispatch}>
        {children}
      </UserDispatchContext.Provider>
    </UserStateContext.Provider>
  );
};

const useUserState = () => {
  const context = useContext(UserStateContext);
  if (context === undefined) {
    throw new Error("useUserState must be used within a UserProvider");
  }
  return context;
};

const useUserDispatch = () => {
  const context = useContext(UserDispatchContext);
  if (context === undefined) {
    throw new Error("useUserDispatch must be used within a UserProvider");
  }
  return context;
};

const useUser = () => {
  return [useUserState(), useUserDispatch()];
};

UserProvider.propTypes = {
  children: PropTypes.node,
};

export { UserProvider, useUserState, useUserDispatch, useUser };
```

`useReducer` accepts a reducer function as its first parameter and an
initial state as its second parameter. It returns an array where the first
element contains the state and the second element is a dispatch function.

To update the state, `dispatch` function is called along with an action object
which contains the action type and the payload. It calculates the new state
depending upon the action object and returns it.

To see how they are used in a production application you can refer to the
`user.js` context file in
[wheel repository](https://github.com/bigbinary/wheel/blob/master/app/javascript/src/contexts/user.jsx).

Make sure to declare an alias for the `contexts` and `reducers` directory inside
the webpack config so you can easily import files from this directory. Please
refer to the
[create alias for commonly used directories](books/react-best-practices/create-alias-for-commonly-used-directories)
chapter for more information on this.

The user context in the above code can be consumed like this:

```jsx
// Main.jsx
import React, { useState } from "react";
import { UserProvider } from "contexts/user";

const Main = () => (
  <UserProvider>
    <Header />
  </UserProvider>
);

// Header.jsx
import React from "react";

const Header = () => <Navbar />;

// Navbar.jsx
import React from "react";
import { useUserState } from "contexts/user";

const Navbar = () => {
  const { user } = useUserState();

  return <h2>{user.name}</h2>;
};
```

Similarly the user context can be updated like this:

```jsx
// Main.jsx
import React from "react";

import { UserProvider } from "contexts/user";

const Main = () => (
  <UserProvider>
    <Home />
  </UserProvider>
);

// Home.jsx
import React, { useEffect } from "react";

import { useUserDispatch, useUserState } from "contexts/user";

const Home = () => {
  const { user } = useUserState();
  const userDispatch = useUserDispatch();

  useEffect(() => {
    userDispatch({
      type: "SET_USER",
      payload: { name: "Oliver", email: "oliver@example.com" },
    });
  }, []);

  return (
    <div>
      <p>{user.name}</p>
      <p>{user.email}</p>
    </div>
  );
};
```

If you are wondering why we didn't use the `UserProvider` context provider
component inside the `Header` component to wrap the `Navbar` component because
we are consuming the user context only inside the `Navbar` component, it's
because in a production application, there will be components other than the
`Header` component and those components might need to consume the `user` context
too.

So to make sure that the context is accessible inside all the components, we
have used the context provider inside the `Main` component which is usually the
component where the routes for other components are defined.

To learn more about the React context API, please refer to the
[`useContext hook chapter`](https://courses.bigbinaryacademy.com/advanced-react-js/advanced-hooks/usecontext-hook/)
in the ReactJS course at BigBinary Academy.
