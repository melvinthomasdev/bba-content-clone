Let's look at an example:

```javascript
console.log("Hello");
searchOnGoogle("Learn Javascript");
console.log("Hi");
```

This is what happens in the example given above:

1. The JavaScript engine prints `Hello` to the console.
3. When the JavaScript engine encounters `searchOnGoogle("Learn Javascript")`,
   it tries to search on Google. If Google is slow that day,
   JavaScript just waits for the results, not doing anything else,
   even though it could be doing something useful.
   This effectively **blocks** the execution of the program.
4. Only after the search operation completes
   does the JavaScript engine print `Hi` to the console.

With **asynchronous** code, the JavaScript engine could have
initiated the search operation and concurrently
executed other tasks while waiting for the search results.
