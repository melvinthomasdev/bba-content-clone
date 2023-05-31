In React, a reusable component is a piece of UI that can be used in various
parts of an application to build more than one UI instance.

For instance, we can have a `Button` component that displays different texts on
different pages. Generally speaking, we can make a component more reusable by
turning it from more specific to more generic.

## Features

Let us create the following components in this chapter. We will make each of
these components reusable with the help of props:

- Navbar
- Table
- Input
- Button
- PageLoader
- Tooltip

<image>navbar-and-table-components.png</image>

<image>input-and-button-components.png</image>

## Technical design

In this chapter we will make the following changes:

- We will be creating a reusable `Button` component. In our Button component, we
  will provide options to update the `type` of the `button` and the handler for
  the button events. Along with that, we will also provide a `loading` option,
  which comes in handy when submitting a form.

- While naming the components, we will follow `PascalCase` for naming both the
  exported component as well as the filename.

- Create a `Navbar` Component that will show us `nav items` like `todos` and
  `logout`.

- We will add `remixicon` package to the project, which will allow us to use
  icons by specifying the icon code in the class names of an HTML tag.

- We will be adding a reusable `Input` component. In that we will have options
  to give the `type` of the input and the handler for the input change events.
  Along with that, we will also provide a `label` and `placeholder` options.

- There are cases where the page can't be rendered yet due to invalid data or
  due to not receiving a response from an API call. In such situations to let
  the user know that the page is loading, we will create a `PageLoader`
  component.

- We need a visually understandable structure for listing tasks along with their
  details and corresponding icons. For that let's create a reusable `Table`
  component that will consist of `Row`'s and a `Header`.

- We also need a `Tooltip` component to view the full title of a Task if it gets
  truncated due to its length.

We are now ready to move to the implementation part. Let us dive in.

## Custom Tailwind colors

We will be using, custom defined color classes to style our components. To do
so, add the following lines of code to `tailwind.config.js`:

```javascript {8-23}
module.exports = {
  future: {
    // removeDeprecatedGapUtilities: true,
    // purgeLayersByDefault: true,
  },
  purge: [],
  theme: {
    extend: {
      colors: {
        "bb-purple": "#5469D4",
        "bb-env": "#F1F5F9",
        "bb-border": "#E4E4E7",
        "bb-gray-700": "#37415",
        "bb-gray-600": "#4B5563",
        "bb-red": "#F56565",
        "bb-green": "#31C48D",
        "bb-yellow": "#F6B100",
        "nitro-gray-800": "#1F2937",
      },
      boxShadow: {
        "custom-box-shadow": "10px 10px 5px 200px rgba(0,0,0,1)",
      },
    },
  },
  variants: {},
  plugins: [],
};
```

## Install Ramda

We recommend using [Ramda](https://ramdajs.com/) library over
[lodash](https://lodash.com/) for most of the JavaScript operations and helpers
since it's well maintained, functional and lightweight.

In general when checking whether a variable is `null`/`empty` etc, use the
`isNil`/`isEmpty` functions from `ramda`. Similarly Ramda functions are highly
extensile and importantly reusable.

Install `ramda` first:

```bash
yarn add ramda
```

## Install classnames

We are going to use a library called `classnames` in components. It is a
JavaScript library for conditionally joining CSS classes together.

React terms these joined attributes as `classNames`.

We use this library extensively in most of our projects and thus will be using
the same throughout this book.

Install `classnames` package by running the following command:

```bash
yarn add classnames
```

## Button component

The components folder should be present in your application since we ran
relevant commands as part of setting up Webpacker in the previous chapters.

**But do check if the `components` folder exists in the `app/javascript/src`
directory. Only run the following command if the `components` folder doesn't
already exists.**

```bash
mkdir -p app/javascript/src/components
```

Let's now create a `Button` component file by running the following command:

```bash
touch app/javascript/src/components/Button.jsx
```

In `Button.jsx` paste the following content:

```jsx
import React from "react";

import classnames from "classnames";
import PropTypes from "prop-types";

const noop = () => {};

const Button = ({
  type = "button",
  buttonText,
  onClick = noop,
  loading,
  className = "",
}) => {
  const handleClick = e => {
    if (!loading) return onClick(e);

    return null;
  };

  return (
    <div className="mt-6">
      <button
        type={type}
        onClick={handleClick}
        disabled={loading}
        className={classnames(
          [className],
          "relative flex justify-center w-full px-4 py-2 text-sm font-medium leading-5 text-white transition duration-150 ease-in-out  border border-transparent rounded-md group hover:bg-opacity-90 focus:outline-none",
          {
            "bg-bb-purple": !loading,
            "bg-bb-gray-700": loading,
            "cursor-wait": loading,
          }
        )}
      >
        {loading ? "Loading..." : buttonText}
      </button>
    </div>
  );
};

Button.propTypes = {
  type: PropTypes.string,
  buttonText: PropTypes.string,
  loading: PropTypes.bool,
  onClick: PropTypes.func,
};
export default Button;
```

To import `Button` component in any of the views, we need to add the following
line at the top of the file:

```jsx
import Button from "components/Button";
```

## Navbar component

Let's create a `NavItem` reusable component:

```bash
mkdir -p app/javascript/src/components/NavBar/
touch app/javascript/src/components/NavBar/NavItem.jsx
```

In `NavItem.jsx`, paste the following content:

```jsx
import React from "react";
import { Link } from "react-router-dom";

const NavItem = ({ iconClass, name, path }) => {
  return (
    <Link
      to={path}
      className="inline-flex items-center px-1 pt-1 mr-3
      font-semibold text-sm leading-5
      text-indigo-500 hover:text-indigo-500"
    >
      {iconClass && <i className={`${iconClass} text-bb-purple`}></i>}
      {name}
    </Link>
  );
};

export default NavItem;
```

To create a `NavBar` component which will make use of the `NavItems`, run the
following command:

```bash
touch app/javascript/src/components/NavBar/index.jsx
```

It's named `index.jsx` because it's the root file which will be auto-imported in
scenarios where we import like say `import NavBar from '../NavBar'`.

In `index.jsx`, paste the following content:

```jsx
import React from "react";
import NavItem from "./NavItem";

const NavBar = () => {
  return (
    <nav className="bg-white shadow">
      <div className="px-2 mx-auto max-w-7xl sm:px-4 lg:px-8">
        <div className="flex justify-between h-16">
          <div className="flex px-2 lg:px-0">
            <div className="hidden lg:flex">
              <NavItem name="Todos" path="/" />
              <NavItem
                name="Add"
                iconClass="ri-add-fill"
                path="/tasks/create"
              />
            </div>
          </div>
          <div className="flex items-center justify-end">
            <a
              className="inline-flex items-center px-1 pt-1 text-sm
             font-semibold leading-5 text-bb-gray-600 text-opacity-50
             transition duration-150 ease-in-out border-b-2
             border-transparent hover:text-bb-gray-600 focus:outline-none
             focus:text-bb-gray-700 cursor-pointer"
            >
              LogOut
            </a>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default NavBar;
```

## Add remixicon to dependencies

To display icons in our application, we will install a third-party package
called [remixicon](https://remixicon.com/). This library has a lot of icons
which we can use in our code. We are not required to import the icons in our
components.

Run the below command to add `remixicon` package:

```bash
yarn add remixicon
```

We also need to add the remixicon CSS to our JavaScript stylesheets to properly
render the icons.

Append the following lines to `app/javascript/stylesheets/application.scss`:

```scss
@import url("https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css");
```

## Container component

To create a `Container` component, run the following command:

```bash
touch app/javascript/src/components/Container.jsx
```

Now, open `app/javascript/components/Container.jsx` and paste the following
content:

```jsx
import React from "react";

import classnames from "classnames";
import NavBar from "components/NavBar";

import PropTypes from "prop-types";

const Container = ({ children, className = "" }) => {
  return (
    <>
      <NavBar />
      <div
        className={classnames("px-4 py-2 mx-auto max-w-7xl sm:px-6 lg:px-8", [
          className,
        ])}
      >
        <div className="max-w-3xl mx-auto">{children}</div>
      </div>
    </>
  );
};

Container.propTypes = {
  children: PropTypes.node.isRequired,
};

export default Container;
```

To import the `Container` component in any of the views, we can do the
following:

```jsx
import Container from "components/Container";
```

## Input component

To create an `Input` component, run the following command:

```bash
touch app/javascript/src/components/Input.jsx
```

In `Input.jsx`, paste the following content:

```jsx
import React from "react";

import classnames from "classnames";
import PropTypes from "prop-types";

const Input = ({
  type = "text",
  label,
  value,
  onChange,
  placeholder,
  disabled = false,
  required = true,
  className = "",
}) => {
  return (
    <div className="mt-6">
      {label && (
        <label
          className="block text-sm font-medium
              leading-5 text-bb-gray-700"
        >
          {label}
        </label>
      )}
      <div className="mt-1 rounded-md shadow-sm">
        <input
          type={type}
          required={required}
          value={value}
          onChange={onChange}
          placeholder={placeholder}
          disabled={disabled}
          className={classnames(
            "block w-full px-3 py-2 placeholder-gray-400 transition duration-150 ease-in-out border border-gray-300 rounded-md appearance-none focus:outline-none focus:shadow-outline-blue focus:border-blue-300 sm:text-sm sm:leading-5",
            [className]
          )}
        />
      </div>
    </div>
  );
};

Input.propTypes = {
  type: PropTypes.string,
  label: PropTypes.string,
  value: PropTypes.node,
  placeholder: PropTypes.string,
  onChange: PropTypes.func,
  required: PropTypes.bool,
};

export default Input;
```

We can import this `Input` component by using following line:

```jsx
import Input from "components/Input";
```

## Table component

To create a `Table` component we will create a `Row` and `Header` component:

```bash
mkdir -p app/javascript/src/components/Tasks/Table/
touch app/javascript/src/components/Tasks/Table/Row.jsx
```

In `Row.jsx`, paste the following content:

```jsx
import React from "react";
import PropTypes from "prop-types";

const Row = ({ data }) => {
  return (
    <tbody className="bg-white divide-y divide-gray-200">
      {data.map(rowData => (
        <tr key={rowData.id}>
          <td
            className="block w-64 px-6 py-4 text-sm font-medium
            leading-8 text-bb-purple capitalize truncate"
          >
            {rowData.title}
          </td>
        </tr>
      ))}
    </tbody>
  );
};

Row.propTypes = {
  data: PropTypes.array.isRequired,
};

export default Row;
```

Create `Header` component by running the following command:

```bash
touch app/javascript/src/components/Tasks/Table/Header.jsx
```

In `Header.jsx`, parse the following content:

```jsx
import React from "react";

const Header = () => {
  return (
    <thead>
      <tr>
        <th className="w-1"></th>
        <th
          className="px-6 py-3 text-xs font-bold leading-4 tracking-wider
        text-left text-bb-gray-600 text-opacity-50 uppercase bg-gray-50"
        >
          Title
        </th>
        <th
          className="px-6 py-3 text-sm font-bold leading-4 tracking-wider
        text-left text-bb-gray-600 text-opacity-50 bg-gray-50"
        >
          Assigned To
        </th>
        <th className="px-6 py-3 bg-gray-50"></th>
      </tr>
    </thead>
  );
};

export default Header;
```

Now, create an `index.jsx` file inside the `Table` folder by running the
following command:

```bash
touch app/javascript/src/components/Tasks/Table/index.jsx
```

Paste the following content in `Table/index.jsx`:

```jsx
import React from "react";

import Header from "./Header";
import Row from "./Row";

const Table = ({ data }) => {
  return (
    <div className="flex flex-col mt-10 ">
      <div className="my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
        <div className="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8">
          <div className="overflow-hidden border-b border-gray-200 shadow md:custom-box-shadow">
            <table className="min-w-full divide-y divide-gray-200">
              <Header />
              <Row data={data} />
            </table>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Table;
```

Now, `Table` can be imported by using following line:

```jsx
import Table from "components/Tasks/Table";
```

## PageLoader component

To create a `PageLoader` component, run the following command:

```bash
touch app/javascript/src/components/PageLoader.jsx
```

In `PageLoader.jsx`, paste the following content:

```jsx
import React from "react";

import classnames from "classnames";

const PageLoader = ({ className = "" }) => {
  return (
    <div
      className={classnames(
        [className],
        "flex flex-row items-center justify-center w-screen h-screen"
      )}
    >
      <h1 className="text-lg leading-5">Loading...</h1>
    </div>
  );
};

export default PageLoader;
```

To use the loader component use the following line.

```jsx
import PageLoader from "components/PageLoader";
```

## Tooltip Component

First, create the `Tooltip` component file by running the following command:

```bash
touch app/javascript/src/components/Tooltip.jsx
```

In `Tooltip.jsx`, paste the following content:

```jsx
import React, { useState } from "react";

import classnames from "classnames";
import PropTypes from "prop-types";

const Tooltip = ({ direction, content, delay, children, className = "" }) => {
  const [active, setActive] = useState(false);
  let timeout;

  const showTip = () => {
    timeout = setTimeout(() => {
      setActive(true);
    }, delay || 400);
  };

  const hideTip = () => {
    clearInterval(timeout);
    setActive(false);
  };

  return (
    <div
      className="tooltip-wrapper"
      onMouseEnter={showTip}
      onMouseLeave={hideTip}
    >
      {children}
      {active && (
        <div
          className={classnames(
            [className],
            `tooltip-tip ${direction || "top"}`
          )}
        >
          {content}
        </div>
      )}
    </div>
  );
};

Tooltip.propTypes = {
  direction: PropTypes.oneOf(["top", "left", "bottom", "right"]),
  delay: PropTypes.number,
  content: PropTypes.node,
  children: PropTypes.node,
};

export default Tooltip;
```

## 7-in-1 Sass Pattern

Whenever we use custom styles in our projects we prefer `7-in-1` Sass pattern to
maintain our stylesheets. The name comes from the fact that the structure
contains 7 folders and 1 file. We store the partial styles like `variables` or
styles for `components` in 7 different folders and a single file at the root
level, in our case `application.scss`, that imports them all along with package
styles to be compiled into a CSS Stylesheet.

We can create our `7-in-1` structure by running the following commands:

```bash
mkdir app/javascript/stylesheets/{abstracts,base,components,layout,pages,themes,vendors}
find app/javascript/stylesheets/* -type d -exec touch {}/.keep \;
```

These commands will create the following structure and add a `.keep` file to
each folder. The `.keep` file, also called a gitkeep file, is an empty file that
is created in an empty directory so that git commits the directory. By
convention, empty directories are not committed to git repositories.

Now the stylesheets folder will be having the following structure:

```bash
brew install tree
cd app/javascript/stylesheets
tree
.
├── abstracts
├── base
├── components
├── layout
├── pages
├── themes
├── vendors
└── application.scss
```

You can read more about the `7-in-1` pattern from the
[official Sass guide](https://sass-guidelin.es/#the-7-1-pattern).

## Styling Tooltip Component

Now we need to add some styling to our `Tooltip` component to make sure it is
positioned correctly based on the `direction` prop.

Make sure your stylesheets folder has the same structure as it was mentioned in
the previous section. We will be adding `_variables.scss` file to `/abstracts`
folder and `_tooltip.scss` to the `/components` folder.

You can do so by running the following commands from the root of your project:

```bash
touch app/javascript/stylesheets/abstracts/_variables.scss
touch app/javascript/stylesheets/components/_tooltip.scss
```

We will define `tooltip-wrapper` and `tooltip-tip` in `_tooltip.scss`, while
`_variables.scss` will contain hardcoded values for easier customization.

Add the following lines in `stylesheets/abstracts/_variables.scss`:

```scss
//Tooltip variables for customization
$tooltip-text-color: #f8f9f9;
$tooltip-background-color: #2f3941;
$tooltip-margin: 10px;
$tooltip-arrow-size: 6px;
```

Now copy and paste the following lines to
`stylesheets/components/_tooltip.scss`:

```scss
//Wrapper for the element truncating
.tooltip-wrapper {
  display: flex;
  position: absolute;
}

//Positioning tooltip along with the wrapped element
.tooltip-tip {
  position: absolute;
  border-radius: 4px;
  left: 50%;
  transform: translateX(-50%);
  padding: 6px;
  color: $tooltip-text-color;
  background: $tooltip-background-color;
  font-size: 14px;
  font-family: sans-serif;
  line-height: 1;
  z-index: 100;
  white-space: nowrap;
  //Adding the tooltip arrow
  &::before {
    content: " ";
    left: 50%;
    border: solid transparent;
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-width: $tooltip-arrow-size;
    margin-left: calc(#{$tooltip-arrow-size} * -1);
  }
  //Style if the tooltip is to be displayed at the top of the wrapped element
  &.top {
    top: calc(#{$tooltip-margin + 15px} * -1);
    left: 50%;
    // Adjusting the tooltip arrow for direction
    &::before {
      top: 100%;
      border-top-color: $tooltip-background-color;
    }
  }
  //Style if the tooltip is to be displayed at the right of the wrapped element
  &.right {
    left: calc(100% + #{$tooltip-margin});
    top: 50%;
    transform: translateX(0) translateY(-50%);
    // Adjusting the tooltip arrow for direction
    &::before {
      left: calc(#{$tooltip-arrow-size} * -1);
      top: 50%;
      transform: translateX(0) translateY(-50%);
      border-right-color: $tooltip-background-color;
    }
  }

  //Style if the tooltip is to be displayed at the bottom of the wrapped element
  &.bottom {
    bottom: calc(#{$tooltip-margin} * -1);
    // Adjusting the tooltip arrow for direction
    &::before {
      bottom: 100%;
      border-bottom-color: $tooltip-background-color;
    }
  }
  //Style if the tooltip is to be displayed at the left of the wrapped element
  &.left {
    left: auto;
    right: calc(100% + #{$tooltip-margin});
    top: 50%;
    transform: translateX(0) translateY(-50%);
    // Adjusting the tooltip arrow for direction
    &::before {
      left: auto;
      right: calc(#{$tooltip-arrow-size} * -2);
      top: 50%;
      transform: translateX(0) translateY(-50%);
      border-left-color: $tooltip-background-color;
    }
  }
}
```

Finally, we need to import these stylesheets in `stylesheets/application.scss`,
like so:

```scss
//Previous code
@import "abstracts/variables";
@import "components/tooltip";
```

## The Ampersand Operator in Sass

You might have noticed the use of `&` inside of `tooltip-tip` class in our
`_tooltip.scss` stylesheet. The `&` operator is an extremely useful feature in
Sass. It is used in nesting when you want to create a more specific selector,
for example when you want to select an element that has both the classes:

```scss
.tooltip-tip {
  &.top {
    //styles only for elements with class .tooltip-tip.top
  }
}
```

In the above code, the block after `&` compiles to:

```css
.tooltip-tip.top {
  /*styles only for elements with class .tooltip-tip.top*/
}
```

Here are a few references to learn more about the `&` operator in Sass:

- [The Sass Ampersand](https://css-tricks.com/the-sass-ampersand/),
- [Parent Selector](https://sass-lang.com/documentation/style-rules/parent-selector).

## The BEM Model

One of the important use cases of the `&` operator is to implement the BEM
model.

BEM (Block Element Modifier) is a naming methodology which aims to solve many of
the problems you'll commonly encounter when naming classes and structuring your
CSS. It also enables you to create reusable front end components.

Essentially Blocks are independent, reusable components in a webpage like
`tooltip-wrapper` in our case. These blocks can have elements and modifiers.

Elements are children of Blocks, and in our case, it's `tooltip-tip`. Elements
can have modifiers applied to them.

Modifiers represent different states or styles of classes. In our case this
would be `tooltip-tip.top`,`tooltip-tip.bottom` etc.

```scss
//Element
.tooltip-tip {
  //Modifier
  &.top {
  }
}
```

These modifiers can be used to control the style or state of a Component
conditionally from React. For example in our `Tooltip` component we can specify
the `direction` prop to specify which of the `top`, `bottom`, `left` or `right`
modifier's styles get applied on our `Tooltip` component.

For example We can pass `bottom` value to the `direction` prop like so:

```jsx
<Tooltip content="Bottom Tooltip" direction="bottom">
  <h1>Tooltip Child</h1>
</Tooltip>
```

This will result in only the `bottom` style block being applied to
`tooltip-tip`:

```scss
.tooltip-tip {
  //Previous styles
  &.bottom {
    bottom: calc(#{$tooltip-margin} * -1);
    // Adjusting the tooltip arrow for direction
    &::before {
      bottom: 100%;
      border-bottom-color: $tooltip-background-color;
    }
  }
}
```

You can read the more about the BEM Model in the following references:

- [BEM 101](https://css-tricks.com/bem-101/),
- [MindBEMding](https://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/).

To import the Tooltip component refer to the following line:

```jsx
import Tooltip from "components/Tooltip";
```

And then wrap the component we want tooltip over with the `<Tooltip>` component.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added reusable components"
```

## References

- [Type Checking with React](https://reactjs.org/docs/typechecking-with-proptypes.html)
- [Reusability with React Components](https://medium.com/walmartglobaltech/how-to-achieve-reusability-with-react-components-81edeb7fb0e0)
- [A Quick Intro in React Children](https://codeburst.io/a-quick-intro-to-reacts-props-children-cb3d2fce4891)
