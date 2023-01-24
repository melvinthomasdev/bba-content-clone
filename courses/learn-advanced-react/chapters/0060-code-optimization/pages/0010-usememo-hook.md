Memoization is an optimization technique where the result of a computationally expensive process is remembered so that it can be used later. Doing so saves us from running the expensive computation every time to get the result.

Say there's a function within a component that calculates the factorial of a prop. Like so:

```jsx
import React, {useEffect, useState} from 'react';

//A trivial example of an expensive function
const findFactorial = num => num ? (num * findFactorial(num - 1)) : 1;

const NodeRenderer = ({value}) => {
  const shouldRenderNodes = findFactorial(value) > 1000000

  return (
    <div className="nodeRenderer">
      {shouldRenderNodes && <p>Nodes Render Placeholder</p>}
    </div>
  )
}
```

The problem here is that factorials are expensive to calculate and you don't want it to re-calculate this value on every single render.
We can run it only when necessary by using the `useMemo` hook as shown below:

```jsx
import React from 'react';

//A simple example of an expensive function
const findFactorial = num => num ? (num * findFactorial(num - 1)) : 1;

const NodeRenderer = ({value}) => {
  const shouldRenderNodes = useMemo(() => {
    return findFactorial(value) > 1000000
  }, [value])

  return (
    <div className="nodeRenderer">
      {shouldRenderNodes && <p>Nodes Render Placeholder</p>}
    </div>
  )
}
```

The useMemo hook ensures that the `const shouldRenderNodes` renders only when the `value` changes.