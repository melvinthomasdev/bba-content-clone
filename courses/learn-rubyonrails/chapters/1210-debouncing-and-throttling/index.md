## Performance optimization

One of the easiest ways to optimize a website's performance is to reduce the
number of times hefty functions are invoked. A function is considered hefty when
it performs a cumbersome task like executing a database query through an API
request. Often, a developer can optimize the application’s performance by
caching these API requests. But what happens when the execution of these
functions is no longer under the control of the developers but at the mercy of
the users?

These scenarios often transpire when the developers attach functions to DOM
events. In such cases, the number of times a function gets fired solely depends
on how often the corresponding events get triggered by the user.

For instance, consider a search bar that filters certain items from the database
depending on the query that the user types in. Note that here, filtering and
fetching from the database can be considered as the `function`, and the process
of typing something in the search bar can be considered as the `event`. If the
filter action is triggered every time the user types in a letter, without any
delay, then it can pose a huge load on the server. Moreover, most of the
requests that are sent to the server, before the user completes the query, are
redundant. To put this in layman's terms, if we are intending to search for a
`shoe` on amazon.com, then it only makes sense for the server to load up the
results once we finish typing `shoe` as a whole word rather than processing the
search for `s`, `sh`, `sho` etc. This is where debouncing and throttling
mechanisms can help you improve the application’s performance.

## Debouncing

Debouncing helps you reduce the number of times a function is called by
executing it after a cooling period. Let us delve deeper into this mechanism
with the help of an example.

Consider the case where Oliver decides to search for a `shoe` on amazon.com. Let
us assume that the cooling period is 350ms. Initially, he types `s` in the
search bar. This activates the cooling period timer. So if Oliver waits and
350ms elapses, the filter action is executed. On the contrary, if he immediately
types the next letter `h` before 350ms passes, then the timer is reset. In this
case, the function is executed only after the latter types `sh` and waits for
the new cooling period to end. Following this trend, if he types all the letters
consecutively without any delay, the function is executed only once after the
entire word is typed.

At BigBinary, we use custom hooks to implement debouncing. We should place all
such reusable hooks within the `src/hooks` folder. So the following hook should
be maintained in a `app/javascript/src/hooks/useDebounce.js` file.

```js
import { useState, useEffect } from "react";

const useDebounce = (value, delay = 350) => {
  const [debouncedValue, setDebouncedValue] = useState(value);

  useEffect(() => {
    const handler = setTimeout(() => {
      setDebouncedValue(value);
    }, delay);

    return () => {
      clearTimeout(handler);
    };
  }, [value]);
  return debouncedValue;
};

export default useDebounce;
```

We can see that the `debouncedValue` is set to the query `value` only after
`delay` milliseconds elapses. If the `value` is changed before `delay`
milliseconds, then the cleanup mechanism of the useEffect hook clears the
`delay`.

The above hook can be used in the following manner:

```js
import React, { useEffect, useState } from "react";

import { useDebounce } from "./useDebounce";

const App = () => {
  const [value, setValue] = useState("hello");
  const debouncedValue = useDebounce(value);

  const handleChange = event => {
    setValue(event.target.value);
  };

  useEffect(() => {
    // Do fetch here...
    // Triggers when "debouncedValue" changes
  }, [debouncedValue]);

  return (
    <div>
      Input: <input value={value} onChange={onChange} />
    </div>
  );
};

export default App;
```

## Throttling

Throttling is very similar to debouncing in terms of its functionality. But
unlike the latter, here the function is executed at regular intervals.

Let us understand this better with the help of the previous scenario where
Oliver searches for a `shoe`. If the throttling mechanism is in action, then
regardless of whether Oliver decides to wait or type consecutively, the function
is invoked only at fixed regular intervals.

Given below is the implementation for `useThrottle` hook. Just like other
reusable hooks, we maintain this inside the `src/hooks` folder within the file
`useThrottle.js`.

```js
import { useEffect, useRef, useState } from "react";

const useThrottle = (value, interval = 800) => {
  const [throttledValue, setThrottledValue] = useState(value);
  const lastExecuted = useRef(Date.now());

  useEffect(() => {
    if (Date.now() >= lastExecuted.current + interval) {
      lastExecuted.current = Date.now();
      setThrottledValue(value);
    } else {
      const timerId = setTimeout(() => {
        lastExecuted.current = Date.now();
        setThrottledValue(value);
      }, interval);

      return () => clearTimeout(timerId);
    }
  }, [value, interval]);

  return throttledValue;
};
```

Here the `throttledValue` is set only after the desired time interval elapses.
The above hook can be used in the following manner:

```js
import React, { useEffect, useState } from "react";

import { useThrottle } from "./useThrottle";

const App = () => {
  const [value, setValue] = useState("hello");
  const throttledValue = useThrottle(value);

  const handleChange = event => {
    setValue(event.target.value);
  };

  useEffect(() => {
    // Do fetch here...
    // Triggers when "throttledValue" changes
  }, [throttledValue]);

  return (
    <div>
      Input: <input value={value} onChange={onChange} />
    </div>
  );
};

export default App;
```

In summary, debouncing and throttling are two techniques that are used to
improve the performance and efficiency of web applications by limiting the rate
at which functions are called and executed. These techniques can be especially
useful when dealing with events that can generate multiple calls in a short
period of time, such as user input events.

## References

- https://blog.webdevsimplified.com/2022-03/debounce-vs-throttle/
