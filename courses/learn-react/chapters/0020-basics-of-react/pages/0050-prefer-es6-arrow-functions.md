Arrow functions as shown in the previous two examples are one of the most popular features introduced in ES6. They are preferred over using the `function` keyword due to their shorter syntax which improves code readability. Here's a quick refresher on its syntax:

```javascript
const squareOf = num => {
  return num ** 2;
};
```

If you just need to return a single value like the example shown above, you can shorten it even further using the implicit return syntax as shown: 

```javascript
const squareOf = num => num ** 2;
```

If the function body is just a single expression, that value is taken as its "implicit return".

Another less-known benefit is that the `this` keyword in arrow functions always represents the object that defined it. Using the `function` keyword, `this` represents the object that called the function which could vary and make the code error-prone. This feature isn't used a whole lot with modern functional components so we're not going to be explaining it here but we'll leave some resources should you wish to dive deeper:

- [Understanding "this" in JavaScript with arrow functions](https://www.codementor.io/@dariogarciamoya/understanding-this-in-javascript-with-arrow-functions-gcpjwfyuc)