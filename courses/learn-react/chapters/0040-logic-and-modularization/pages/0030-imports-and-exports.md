The reusability of your components is what makes React so convenient.

Splitting components into separate files is extremely useful in this regard as it keeps all your components easier to read and reuse.

Thus we have import and export statements. As the names suggest, they allow us to import and export components across files.

## Default export

If you have a single component in a file that you wish to make available within other files, add a line `export default ComponentName` where ComponentName is the name of the component you wish to export like so:

```jsx
{/* WelcomeText.jsx */}
const WelcomeText = ({name}) => (
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

## Named export

If you need to export multiple entities from a single file, the default export cannot help as a file can only have one default export

To export multiple components from a file, add a line `export {Component1, Component2}` where Component1 & Component2 are the names of the components you wish to export like so:

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
const WelcomeText = ({name}) => (
  <div> Welcome {name}! </div>
)

export WelcomeText
```

And import it as `import { WelcomeText } from './WelcomeText.jsx'` from an adjacent file.

You can also have both default and named exports in a single file. Just import them like so: `import App, {Header, Footer} from './App.jsx'`.

## Import Order

As a general rule of thumb, it is suggested to keep relative imports at the bottom and aliased/library imports at the top.

```jsx
import React, { Component } from 'react';
import Toolbar from '../Toolbar';
import SqlOutput from './SqlOutput';
import Fade from 'react-reveal/Fade';
import debounce from 'lodash/debounce';
import Editor from '../Editor';
import sqljs from 'sql.js';
```

Could be redefined as

```jsx
import React, { Component } from 'react';
import Fade from 'react-reveal/Fade';
import debounce from 'lodash/debounce';
import sqljs from 'sql.js';

import SqlOutput from './SqlOutput';
import Toolbar from '../Toolbar';
import Editor from '../Editor';
```

## Avoid Multiple Imports

Avoid using multiple imports for the same module.

An example of multiple imports from the same namespace like this:

```js
import { Table } from "neetoui";
import { Container } from "neetoui";
```

Should always be refactored to:

```js
import { Table, Container } from "neetoui";
```

If there are multiple components exported from a namespace, then it’s a good idea to add `index.js` within that namespace so that we don’t have to add multiple imports but rather keep it down to a single import.

Consider this example:

```js
import EmptyState from "components/Common/EmptyState";
import Menubar from "components/Common/Menubar";
```

The two components `EmptyState` and `Menubar` are imported from the same namespace (`components/Common`). We can add an `index.js` file in that namespace that looks like this:

```js
import EmptyState from "./EmptyState";
import Menubar from "./Menubar";

export { EmptyState, Menubar };
```

After adding the above `index.js` file we can reduce the number of import statements like so:

```js
import { EmptyState, Menubar } from "components/Common";
```

Notice that the pathname isn't `components/Common/index.jsx`. It's unnecessary to suffix the path with `index.jsx` as it will automatically be resolved by node using Webpack which we will discuss later.

## Importing under an alias

If you have a conflict between a third-party import and your component name, then you could use an alias to import the third-party entity.

Consider a `Pane` component like so:

```jsx
{/* Pane.jsx */}
// Broken code
import { Pane } from "neetoui";

const Pane = () => {
  // rest of the component
};
```

Having a `Pane` from the `neetoUI` package and a custom `Pane` will lead to a conflict.

To solve such a situation we can import the third-party entities under an alias using the `as` keyword as shown:

```jsx
{/* Pane.jsx */}
// Correct code
import { Pane as NeetoUIPane } from "neetoui";

const Pane = () => {
  // rest of the component
};
```

When naming the alias, do compose it from the library name. In the above example, since `Pane` was from the `NeetoUI` library, we gave `Pane` the alias of `NeetoUIPane`.

Here's another example:

```jsx
import { Card as NeetoUICard, Table } from "neetoui";
import { Card as AntdCard } from "antd";

const Card = () => {
  // rest of the component
};
```

We have not used the alias for `Table` in the above example as it has no conflicts. We should prefer to use the alias name only in case of conflict of the same names.
