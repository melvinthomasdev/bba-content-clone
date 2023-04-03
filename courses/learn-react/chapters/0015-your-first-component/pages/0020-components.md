A React component is essentially a JavaScript function that you'd normally use
to return some JSX we'd built earlier. They are independent and reusable
snippets of code.

Here's a simple React component written with
[an ES6 function](https://academy.bigbinary.com/learn-react/your-first-component/prefer-es6-arrow-functions):

```jsx
const HelloWorld = () => <h1 className="headerBlock">Hello World!</h1>;

export default HelloWorld;
```

This `HelloWorld` function is now a component that can be inserted into another
component like any other JSX tag using the same syntax: `<HelloWorld />`.

We build React apps by creating pages from React components like these.
Components can range in size from tiny icons and buttons to complete pages.

You can piece together smaller components much like puzzle blocks to build
bigger and more complex components as shown:

```jsx
const WelcomeBlock = () => (
  <h1 className="headerBlock">
    Welcome, User
  </h1>
)

const ContactBlock = () => (
  <p className="footerBlock">
    Contact us at test.xyz
  </p>
)

const App = () => (
  <WelcomeBlock />
  Page contents
  <ContactBlock />
)

export default App
```

As you may have noted, all of the above custom components such as `App`,
`ContactBlock` and `WelcomeBlock` use `PascalCase` for the component name.
Meanwhile, the default HTML tags such as `h1`, `p`, `div` use `camelCase` for
the tag names.

This is an important rule to remember when writing React as changing the cases
would make the component non-functional. We will explain how this happens in the
next chapter.
