Arrow functions as shown in the previous two examples are one of the most
popular features introduced in ES6. They are preferred over using the `function`
keyword due to their shorter syntax which improves code readability.

We will be using arrow functions throughout the rest of the guide so here's a
quick refresher on its syntax:

```javascript
const squareOf = num => {
  return num ** 2;
};
```

If you just need to return a single value like the example shown above, you can
shorten it even further using the implicit return syntax as shown:

```javascript
const squareOf = num => num ** 2;
```

If the function body is just a single expression, that value is taken as its
"implicit return".

Another less-known benefit is that the `this` keyword in arrow functions always
represents the object that defined it. When you use the `function` keyword,
`this` represents the object that called the function which could vary and make
the code error-prone.

If you'd like to dive deeper, here's
[a page from our advanced JavaScript guide](https://courses.bigbinaryacademy.com/learn-advanced-javascript/this-on-objects/arrow-function-and-this-1/)
that explains it well.
