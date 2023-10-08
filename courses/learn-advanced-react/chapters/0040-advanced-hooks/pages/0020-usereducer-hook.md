The `useReducer` is a built-in hook similar to the `useState` hook but gives more control out of the box. We can use it to make complex state management a lot simpler.

Do keep in mind, however, that most cases of state management just need a simple `useState` hook. Two good rules of thumb that indicate a `useReducer` hook would improve a piece of code would be:

1. When your data requires complex data like arrays and objects rather than primitive data like strings and integers.
2. When the value of the new state depends on the value of the old state.

## Construction

The `useReducer` hook takes requires two key components :
1. The Initial State
2. The Reducer

### The Initial State

It is a simple initial value much like the one we give to the useState hook when we initialize it. Here's an example of a typical initial state:

```jsx
const initialUsers = [
  {
    id: 1,
    name: "John Appleseed",
    active: true

  },
  {
    id: 2,
    name: "Olivia Greene",
    active: false
  },
];
```

### The Reducer

The reducer is a pure function that takes in the previous state and an action to give out a new state as the output like this: `(prevState, action) => newState`.

We call the reducer "pure" because they have perfectly predictable outputs and no side effects. It makes them very easy to debug and test, especially since they're not involved with React.

The `action` argument generally has a `type` attribute that we use to determine what needs to be done to the state. Any other data we need can be added to this `action` object.

Here's an example of a typical reducer:

```jsx
const reducer = (state, action) => {
  switch (action.type) {
    case "TOGGLE_ACTIVATION":
      return state.map(user => {
        if (user.id === action.id) {
          return { ...user, active: !user.active };
        } else {
          return user;
        }
      });
    default:
      return state;
  }
};
```

### The useReducer Hook

Once we have both the initializer and the reducer, we can construct the useReducer hook with the following syntax:

`useReducer(reducer, initialState)`

The `useReducer` hook returns a state object and a dispatch method you can use to do actions on the state object.

Here's an example of the `useReducer` hook in action with the previously shown `initialState` and `reducer` imported from external files:

```jsx
import { useReducer } from "react";
import {reducer, initialUsers} from "contexts/userContext.js"

const AdminToolbar = () => {
  const [users, dispatch] = useReducer(reducer, initialUsers);

  const toggleUserActivation = user => {
    dispatch({ type: "TOGGLE_ACTIVATION", id: user.id });
  };

  return (
    <>
      {users.map(user => (
        <div key={user.id}>
          <label>
            <input
              type="checkbox"
              checked={user.active}
              onChange={() => toggleUserActivation(user)}
            />
            {user.name}
          </label>
        </div>
      ))}
    </>
  );
}

export default AdminToolbar
```

Do keep in mind that the `useContext` API is meant for low-frequency changes. If you require even more complexity we recommend using other solutions such as [Zustand](https://github.com/pmndrs/zustand).

## Storage

Rather than placing them next to the components they're used at, we recommend placing all the contexts and reducers within a top-level folder like in the hierarchy shown below:

```
├── App.jsx
├── routes.js
├── apis
├── lib
├── utils
├── components
├── hooks
└── stores/
    └── contexts/
        └── userContext.js
```

It helps keep track of changes in logic and makes debugging them a lot easier.