The reusability of your components is what makes React so convenient.

Splitting components into separate files is extremely useful in this regard as it keeps all your components easier to read and reuse.

Thus we have import and export statements. As the names suggest, they allow us to import and export components across files.

The most commonly used method of importing and exporting components is the default method as shown below:

If you have a single component in a file that you wish to make available within other files, just add a line `export default ComponentName` where ComponentName is the name of the component you wish to export like so:

```jsx
{/* WelcomeText.jsx */}
const WelcomeText = ({ name }) => (
  <div> Welcome {name}! </div>
)

export default WelcomeText
```

You can now import this component in another file using `import WelcomeText from '.path/to/WelcomeText.jsx'` like the below example where `WelcomeText.jsx` is in an adjacent file:

```jsx
{/* App.jsx */}
import WelcomeText from './WelcomeText.jsx'

const App = () => (
  <>
    <WelcomeText name="Oliver" />
    <p>Body Content</p>
  </>
)

export default App
```

You can put in any name you'd like after the `import` statement as long as you use the same name across the rest of the app like this example below where `WelcomeText` got renamed to `TestName`:

```jsx
{/* App.jsx */}
import TestName from './WelcomeText.jsx'

const App = () => (
  <>
    <TestName name="Oliver" />
    <p>Body Content</p>
  </>
)

export default App
```

This technique is mainly used when you have the same/similar names that you'd like differentiated.

Aliasing the `WelcomeText` component with the name `TestName` isn't following best naming practices as it makes it harder for a reader to infer what the actual component is. Names have to be meaningful.
