If you need to export multiple entities from a single file, the default export cannot help as a file can only have one default export

To export multiple components from a file, add a line `export {Component1, Component2}` where Component1 & Component2 are the names of the components you wish to export like this:

```jsx
{/* utils.jsx */}
const Header = () => (
  <h1> Welcome! </h1>
)

const Footer = () => (
  <p> Feel free to contact us at email.test.com </p>
)

export { Header, Footer }
```

You can import them in another file using `import { Component1, Component2 } from '.path/to/utils.jsx'` like the below example where `utils.jsx` is in an adjacent file:

```jsx
{/* App.jsx */}
import { Header, Footer } from './utils.jsx'

const App = () => (
  <>
    <Header />
    <p>Body Content</p>
    <Footer />
  </>
)

export default App
```

At BigBinary, we highly recommend using default exports when you only have a single component to export.
However, you can also export a single component using a named export as shown below:

```jsx
{/* WelcomeText.jsx */}
const WelcomeText = ({ name }) => (
  <div> Welcome {name}! </div>
)

export WelcomeText
```

And import it as `import { WelcomeText } from './WelcomeText.jsx'` from an adjacent file.

You can also have both default and named exports in a single file. Just import them like this: `import App, {Header, Footer} from './App.jsx'`.
