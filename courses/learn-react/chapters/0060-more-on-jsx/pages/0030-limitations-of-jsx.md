JSX allows us to write HTML-like syntax inside JavaScript. Under the hood, each JSX tag gets converted to a JavaScript object.

Since JSX is closer to JavaScript than HTML, we need to adhere to the rules of JavaScript while writing JSX.

Here are some of the points to keep in mind while writing JSX.

## 1. Close all the tags

Unlike HTML, we need to close all the tags, including the empty tags such as <br> and <img>:

```jsx
<hr />
<br />
<input type="text" />
<img src="path/to/image" />
```

Closing tags like this helps the transpiler understand where one tag ends and the next begins.

## 2. Single root element

Since JSX is transpiled to `createElement` calls, the following code will be transpiled like this:

```jsx
// JSX code
const Note = ({ title, date, body }) => (
  <h1>{title}</h1>
  <h2>Drafted on: {date}</h2>
  <p className="blue-background" >{body}</p>
);

// Transpiled code
const Note = ({ title, date, body }) => (
  React.createElement("h1", null, title);
  React.createElement("h2", null, "Drafted on:", date);
  React.createElement("p", { className: "blue-background" }, body);
);
```

The above transpiled code tries to return multiple objects. But, JavaScript functions can only return a single value and both the above syntaxes are invalid.

Similarly, when assigning JSX to a variable or constant, we can only assign one JSX tag:

```js
const GREETINGS = (<h1>Hi!</h1><p>Welcome to React</p>);
```

Attempting to assign multiple JSX tags, like this, is syntactically incorrect as we cannot assign multiple objects to a variable or constant:

To solve this issue, React provides a wrapper called `Fragment` to group elements together without adding an extra DOM node.

Here is an example:

```jsx
import { Fragment } from "React";

const Note = ({ title, date, body }) => (
  <Fragment>
    <h1>{title}</h1>
    <h2>Drafted on: {date}</h2>
    <p className="blue-background" >{body}</p>
  </Fragment>
);
```

There is also a shorter syntax for using React fragment without importing it from React:

```jsx
const Note = ({ title, date, body }) => (
  <>
    <h1>{title}</h1>
    <h2>Drafted on: {date}</h2>
    <p className="blue-background" >{body}</p>
  </>
);
```

In general, the shorter syntax for fragments will be sufficient for most cases. However, if we need to wrap multiple elements inside a map method, we must import and use Fragment from React explicitly. This is necessary as we need to provide a unique key prop while mapping:

```jsx
import { Fragment } from "React";

const Articles = ({ articles }) => {
  articles.map(article => (
    <Fragment key={article.id}>
      <h1>{article.title}</h1>
      <p>{article.body}</p>
    </Fragment>
  ));
};
```

## 3. Only expressions are allowed inside {}

We have learned how to pass dynamic values using `{}` in JSX:

```jsx
<p>{article.body}</p>

<Speedometer hasExceededLimit={currentSpeed > maximumLimit} />
```

However, there is a limitation with this syntax. We can only pass expressions inside curly braces `{}`, and not statements like the following:

```jsx
const Speedometer = ({ currentSpeed }) => (
  <>
    <h1>Current Speed: {currentSpeed}</h1>
    <p>
      {/* This is invalid */}
      {if (isHighway) {
        checkHighwayLimit(currentSpeed);
      } else {
        checkCityLimit(currentSpeed);
      }}
    </p>
  </>
);
```

```jsx
<BillAmount
  total={
    /* This is also invalid */
    let total = expenses["food"];
    total += expenses["miscellaneous"];
  }
/>
```

When JSX is converted to JavaScript, the values inside curly braces `{}` are passed to the `children` argument of the `createElement` method. We can only pass expressions to a function argument. This restricts us from directly using statements inside JSX.

However, there are workarounds to address this issue. One way is to move the statements above JSX and assign the result to a variable. We can then render this variable:

```jsx
const Speedometer = ({ currentSpeed }) => {
  let warningMessage;
  if (isHighway) {
    warningMessage = checkHighwayLimit(currentSpeed);
  } else {
    warningMessage = checkCityLimit(currentSpeed);
  }

  return (
    <>
      <h1>Current Speed: {currentSpeed}</h1>
      <p>{warningMessage}</p>
    </>
  );
};
```

Another solution is using [IIFE](https://courses.bigbinaryacademy.com/learn-javascript/immediately-invoked-function-expression/iife/) (Immediately Invoked Function Expression):

```jsx
const Speedometer = ({ currentSpeed }) => (
  <>
    <h1>Current Speed: {currentSpeed}</h1>
    <p>
      {(() => {
        if (isHighway) {
          return checkHighwayLimit(currentSpeed);
        }

        return checkCityLimit(currentSpeed);
      })()}
    </p>
  </>
);
```

However, IIFE is not recommended as it reduces code readability. It's always better to use the variable assignment approach for better clarity and maintainability.
