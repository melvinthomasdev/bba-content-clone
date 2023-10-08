## What is webpack alias?

Define aliases for specific directories in order to simplify import statements.

## Why webpack alias?

Initially, when you start off a project, you don’t mind writing long relative
paths and ignore all the troubles that come with it. But as your project starts
to scale past a certain point of complexity, you’ll find traversing up and down
your file system is **time-consuming** and **error-prone**.

If you are changing the directory structure of a module in your project. This
will break all the module references and you will be forced to change all
occurrences of the module throughout your project. It will be a daunting task!

More on aliasing
https://medium.com/groww-engineering/module-aliasing-in-webpack-f02fe1b91f94.

## Creating alias

Webpack allows you to create aliases to import or require certain modules
through the **resolve.alias** property in your config without any additional
plugins.

Changes to webpack config

```javascript
  resolve: {
    alias: {
      apis: path.resolve(__dirname,"apis" ),
      components: path.resolve(__dirname,"components" ),
      common: path.resolve(__dirname,"components/Common" ),
      images: path.resolve(__dirname, "..", "..", "app/assets/images"),
      constants: path.resolve(__dirname,"components/constants" ),
    },
  },
```

Webpack resolve https://webpack.js.org/configuration/resolve/

## Updating import statements

Instead of this:

```javascript
import { createUser } from "../../../apis/user";
import { Header } from "../../common";
```

It should be written like this:

```javascript
import { createUser } from "apis/user";
import { Header } from "common";
```

Import statements become cleaner after aliasing.

## How Webpack resolves the imports?

Webpack uses the `enhanced-resolve` function to resolve file paths while bundling modules. File import paths can be of three types which are as follows:

- Absolute paths

```jsx
import Table from "~/Desktop/Files/Table";
```

In this type of import where an absolute path is used, there is no resolution required and Webpack will import directly from the given path.

- Relative paths

```jsx
import Input from "common/Input";
import Table from "./Table";
```

In the case of relative import, the directory of the source file where the import is made will be used as the context path. Then the given relative path is joined with the context path to make the absolute path for the module.

If some alias path is used while importing then it will be replaced with the assigned value in the `resolve.alias` object and then an absolute path will be formed to resolve the import.

- Module paths

```jsx
import { ToastContainer } from "react-toastify";
import { MenuBar } from "neetoui/layouts";
```

All the module imports are searched inside all the directories mentioned in the `resolve.modules` in the Webpack config file. The default value for this is `resolve.modules` is the `node_modules`.

Now the Webpack resolver will check to see if the path points to a file or a directory.

If the path points to a file and has a file extension then that file will be bundled directly. But if no file extension is stated then Webpack checks the `resolve.extensions` defined in the Webpack config. This `resolve.extensions` tell the resolver which file extensions are acceptable for resolution, and the first file with the matching extension will be used for import.

If the path points to a directory then Webpack will search for the fields defined in `resolve.mainFields`. Webpack will resolve the import with the first matching field in the directory as mentioned in the `resolve.mainFields`.

If `resolve.mainFields` don't return a valid path then file names specified in `resolve.mainFiles` config is looked for in order to resolve the import.

This `resolve.mainFiles` configuration has a default value of `index`. That's why when we import from a directory without mentioning the file in the path it will automatically load the `index` file.

For example:

```jsx
// Bad import path
import Dashboard from "Components/Dashboard/index";

// Correct import path
import Dashboard from "Components/Dashboard";
```

We can also provide an alias for modules. For example, we can define an alias for `@bigbinary/neetoui` using `resolve.alias` like this:

```js
resolve: {
  alias: {
    neetoui: "@bigbinary/neetoui";
  }
}
```

Now we can make import using alias like this:

```jsx
import { MenuBar } from "neetoui/layouts";
```

Using `@bigbinary` while importing is not right and thus we should always use an alias and import it without the `@bigbinary` prefix.

In the above import Webpack will first check for alias and update the path from "neetoui/layouts" to "@bigbinary/neetoui/layouts". Then it will look for the module in the `node_modules` directory and will resolve the import.
