## Adding React.js to Rails

We will be building our application's frontend in
[React.js](https://reactjs.org), and for this, we will be using
[react-rails](https://github.com/reactjs/react-rails) gem to bring React to our
Ruby on Rails application and hook it into the webpacker compilation system.

Add the following line to the end of the `Gemfile`:

```ruby
gem 'react-rails'
```

Then install the newly added gem:

```bash
bundle install
```

## Webpacker and webpack-dev-server compatibility issues

Running the last command to install `webpacker` might have upgraded the
`webpack-dev-server` version to v^4.x. If the `webpacker` version installed is
v5.x then it might lead to compatibility issues with `webpack-dev-server` v^4.x.

To workaround this issue, please follow the steps mentioned in
[setting a specific Webpacker version section](/learn-rubyonrails/new-ruby-on-rails-application#setting-a-specific-Webpacker-version).

After re-installing the compatible versions for `webpacker` and
`webpack-dev-server` check if the correct versions are installed using the
following command:

```bash
yarn list --pattern "{webpacker,webpack-dev-server}"
```

## Setup React Webpacker pipeline

Webpacker also contains support for integrating many of the popular JavaScript
frameworks and tools. Here we are going to integrate `ReactJS` into our
environment.

When integrating `ReactJs`, the following commands will prompt you to overwrite
the `babel.config.js`, since it works on adding the babel presets for `React`.

Press `y` when prompted for this specific case, when running the following
command:

```bash
bundle exec rails webpacker:install:react # enter y when prompted
```

Please **note** that the overwrite made by the above command has removed a
couple of entries from the `plugins` section of `babel.config.js` which was
added while
[setting up the react environment](https://www.bigbinary.com/learn-rubyonrails/setting-up-react-environment).

Let's first complete setting up the React-Webpacker pipeline by running the
following command:

```bash
bundle exec rails generate react:install
```

And now we have successfully added React.js support to our application.

We have to delete the `components` folder which was automatically created upon
running the above command, since we will be creating the same folder in the
appropriate path later.

Run the following from the root of project to delete the `components` folder:

```bash
rm -rf app/javascript/components
```

## Update the babel config

Before committing the changes, let's also add the `js-logger` back into the
`plugins` array of `babel.config.js` file, like so:

```javascript {2}
  plugins: [
      "js-logger",
      "babel-plugin-macros",
      "@babel/plugin-syntax-dynamic-import",
      isTestEnv && "babel-plugin-dynamic-import-node",
      "@babel/plugin-transform-destructuring",
      ...
  ]
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
/* eslint no-console:0 */
/* global require */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import "stylesheets/application";

// Support component names relative to this directory:
var componentRequireContext = require.context("src", true);
var ReactRailsUJS = require("react_ujs");

// Makes React dev tools etc, work.
ReactRailsUJS.mountComponents();

ReactRailsUJS.useContext(componentRequireContext);
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
