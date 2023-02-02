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

Notice that the pathname isn't `components/Common/index.js`. It's unnecessary to suffix the path with `index.js` as it will automatically be resolved by node using Webpack which we will discuss later.