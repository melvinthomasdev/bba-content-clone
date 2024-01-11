Browsers don't understand JSX. It only understands HTML, CSS and JavaScript. Therefore, the code written in JSX needs to be converted to plain JavaScript. Babel is a toolchain that helps perform this conversion.

Babel was introduced to help developers use new ECMA standard syntaxes without worrying about users using old browsers which don't support it. Babel transforms the code written in ES6 and later versions of JavaScript into JavaScript version supported by current and older browsers.

These transformations comes in the form of plugins. Plugins are small JavaScript programs that instruct Babel on how to carry out transformations to the code. For example, Babel provides a plugin named `@babel/plugin-transform-arrow-functions` that transforms arrow functions into ES5 compatible function expression:

```js
const sum = (a, b) => a + b;

// Get converted to
var sum = function (a, b) {
  return a + b;
};
```

We can use such official plugins to transform our code. We can even write our own plugin to apply any custom transformations.

Instead of adding all the plugins one by one, we can use a "preset" - a pre-determined set of plugins. One such preset available for transforming JSX syntax is `babel-preset-react`. It also offers other React-related features not natively supported by all browsers.

Similar to plugins, we can create our own presets to share any combination of plugins.
