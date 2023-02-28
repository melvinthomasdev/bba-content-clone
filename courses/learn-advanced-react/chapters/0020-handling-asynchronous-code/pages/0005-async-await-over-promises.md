Note: This page assumes you understand what JavaScript promises are. If not, we
recommend going through
[this chapter in our JavaScript guide](https://academy.bigbinary.com/learn-advanced-javascript#promises).

When writing asynchronous functions, we highly recommend using the async/await
syntax rather than promise chains or callbacks.

The `async/await` approach is much more modern and makes asynchronous code a lot
easier to read by structuring it like synchronous code. Anything that improves
code readability also improves the productivity of everyone working on that
code.

Take this example of a function created using a promise chain:

```javascript
const loadProfile = id => {
  return API.fetchProfileData(id)
    .then(profile => {
      setProfile(profile);
      props.navigate(`settings/profile/${id}`);
    })
    .catch(error => {
      console.log(error);
    });
};
```

The above example can be made to look and behave just like synchronous code by
using an `async` function as shown:

```javascript
const loadProfile = async id => {
  try {
    const profile = await API.fetchProfileData(id);
    setProfile(profile);
    props.navigate(`settings/profile/${id}`);
  } catch (error) {
    console.log(error);
  }
};
```

The keyword `async` before the function just tells the compiler to return a
promise instead of a regular function. The keyword `await` before a line of code
pauses the execution of an async function till the promise has been resolved.
While the functionality is nearly the same, the latter is a lot easier to
comprehend compared to the previous pile of nested functions.

If you want to dive deeper into callbacks, promises and async/await, check out
these resources listed below:

- [Asynchronous JavaScript: Introducing async and await](https://www.twilio.com/blog/asynchronous-javascript-introducing-async-and-await)
- [Callback Hell](http://callbackhell.com)
- [JavaScript: Promises and Why Async/Await Wins the Battle](https://dzone.com/articles/javascript-promises-and-why-asyncawait-wins-the-ba#)
- [The official docs on promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise)
