
Take this example of a piece of code that renders a `FriendCard` which contains an `isOnline` state and an effect that runs on when the component is loaded to fetch data for the state:

```jsx
import React, { useState, useEffect } from 'react';

const FriendCard = ({ userURL }) => {
  const [isOnline, setIsOnline] = useState(false);

  const fetchStatus = async () => {
    try {
      const {data: {is_online}} = await axios.get(userURL)
      setIsOnline(is_online)
    } catch(error) {
      console.log(error)
    }
  }

  useEffect(() => fetchStatus(), []);

  return isOnline ? 'Friend is Online' : 'Friend is Offline';
}
```

The code above runs just fine. But what if there was another unrelated section of code that required this same functionality?

Rather than building the same state and effect in another component, we can avoid the repetition by creating a new custom hook called `useFetch` and placing it within a hooks folder at the top level of our app like so:

```
├── App.jsx
├── routes.js
├── apis
├── lib
├── utils
├── components
├── hooks
|   └── useFetch.js
├── stores
```

The custom hook can be constructed like this:

```jsx
import { useState, useEffect } from "react";

const useFetch = userURL => {
  const [isOnline, setIsOnline] = useState(false);

  const fetchStatus = async () => {
    try {
      const {data: {is_online}} = await axios.get(userURL)
      setIsOnline(is_online)
    } catch(error) {
      console.log(error)
    }
  }

  useEffect(() => fetchStatus(), []);

  return isOnline;
};

export default useFetch;
```

This new custom hook can now be imported into any component and used just like any other hook as shown below:

```jsx
import React from 'react';
import useFetch from 'hooks/useFetch'

const FriendCard = ({ userURL }) => {
  const isOnline = useFetch(userURL);

  return isOnline ? 'Friend is Online' : 'Friend is Offline';
}
```

