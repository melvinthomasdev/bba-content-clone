## Adding React.js to Rails

We will be building our application's frontend in
[React.js](https://reactjs.org), and for this, we will be using
[react-rails](https://github.com/reactjs/react-rails) gem to bring React to our
Ruby on Rails application and hook it into the webpacker compilation system.

Add the following line to the end of the `Gemfile`:

```ruby
gem 'react-rails', "~> 2.7.1"
```

Then install the newly added gem:

```bash
bundle install
```

## Setup React Webpacker pipeline

Webpacker also contains support for integrating many of the popular JavaScript
frameworks and tools. Here we are going to integrate `ReactJS` into our
environment.

First let's install react and some other required npm packages:

```bash
yarn add react@^17.0.1 react-dom@^17.0.1 @babel/preset-react@^7.22.5 \
  prop-types@^15.8.1 mini-css-extract-plugin css-minimizer-webpack-plugin
```

Let's complete setting up the React-Webpacker pipeline by running the
following command:

```bash
bundle exec rails generate react:install
```

Executing the command above installs the most recent edition of `react_ujs`, which brings about certain disruptive modifications. To revert, let's downgrade it to version `2.6.2` using the subsequent command:

```bash
yarn add react_ujs@2.6.2
```

And now we have successfully added React.js support to our application.

We have to delete the `components` folder which was automatically created upon
running the above command, since we will be creating the same folder in the
appropriate path later.

Run the following from the root of project to delete the `components` folder:

```bash
rm -rf app/javascript/components
```

## Remove unnecessary pack files

Let's remove the unwanted files which were generated after running the above
commands:

```bash
rm -rf app/javascript/packs/server_rendering.js app/javascript/packs/hello_react.jsx
```

## Keeping src folder as the entry point

Running the previous Webpacker commands might have redeclared
`componentRequireContext` with `components` as the argument in the
`application.js` file.

We have to remove those redeclaration's from `packs/application.js` if it
exists.

Thus fully replace `app/javascript/packs/application.js` with the following
lines of code:

```javascript
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "../stylesheets/application.scss";

const componentRequireContext = require.context("src", true);

const { setAuthHeaders } = require("apis/axios");
const { initializeLogger } = require("common/logger");

initializeLogger();
setAuthHeaders();

const ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext)
```

We are retaining the declaration with `src` folder because `src` folder is the
entry point in our application to load React components. Removing this
declaration will lead to the failure of the app since the `App` component
wouldn't be within the scope of our Rails view pipeline.

## Directory structure

The `src` folder is where the JavaScript code specific to the application is
handled at. This includes `apis`, `commons` etc.

In upcoming chapters, when we create the `components` folder, we will be adding
it under the `src` folder.

This is done so as to handle all the JavaScript/client code under a single path
and have more control over it.

With the last change we made to `application.js`, we have ensured that Webpacker
knows that our application relevant code and its context should be loaded from
the `src` folder.

The `require.context` statement within the `packs/application.js` is used to get
the `src` folder context.

If you want to load components or JavaScript files from a different directory,
then override the path by calling `ReactRailsUJS.useContext` with a different
argument. If `require` of such a path fails to find any relevant files or
folder, then `ReactRailsUJS` falls back to the global namespace.

Note: `npm install` command would add `package-lock.json` which isn't required
as we are using Yarn. Thus avoid using `npm install`. If executed then please
don't commit the `package-lock.json` file. Add `package-lock.json` to the
`.gitignore` file. Use `yarn add` command for installing new packages.

Now let's commit the changes:

```bash
git add -A
git commit -m "Added React.js to the project"
```
