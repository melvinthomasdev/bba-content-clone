A React component is essentially a JavaScript function that you'd normally use to return some markup in the form of the JSX we'd built earlier.

Here's a simple React component:

```jsx
{/* HelloWorld.jsx */}
const HelloWorld = () => (
  <h1 className="headerBlock">
    Hello World!
  </h1>
)

export default HelloWorld
```

This `HelloWorld` function is now a component that can be inserted into another component like any other JSX tag using the same syntax: `<HelloWorld />`

We build React apps by composing pages from React components like these. They can range from tiny icons and buttons to complete pages.

You can piece together smaller components much like puzzle blocks to build bigger and more complex components as shown:

```jsx
{/* App.jsx */}
const WelcomeBlock = () => (
  <h1 className="headerBlock"> Welcome, User </h1>
)

const ContactBlock = () => (
  <p className="footerBlock"> Contact us at test.xyz </p>
)

const App = () => (
  <WelcomeBlock />
  Page contents
  <ContactBlock />
)

export default App
```