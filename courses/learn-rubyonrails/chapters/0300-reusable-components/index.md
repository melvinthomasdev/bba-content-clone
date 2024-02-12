In React, a reusable component is a piece of UI that can be used in various
parts of an application to build more than one UI instance.

For instance, we can have a `Button` component that displays different texts on
different pages. Generally speaking, we can make a component more reusable by
turning it from more specific to more generic.

## Features

Let us create the following components in this chapter. We will make each of
these components reusable with the help of props:

- NavBar
- Table
- Input
- Button
- PageLoader
- PageTitle
- Tooltip

<image alt="NavBar and table components">navbar-and-table-components.png</image>

<image alt="Input and button components">input-and-button-components.png</image>

## Technical design

In this chapter we will make the following changes:

- We will be creating a reusable `Button` component. In our Button component, we
  will provide options to update the `type` of the `button` and the handler for
  the button events. Along with that, we will also provide a `loading` option,
  which comes in handy when submitting a form.

- While naming the components, we will follow `PascalCase` for naming both the
  exported component as well as the filename.

- Create a `PageTitle` component that will display the given `title` for each page.

- Create a `NavBar` Component that will display a `logo` of our project,
  a link to `Todos` and an `Add new task` button.

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
  component that will consist of `Row`s and a `Header`.

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

## Button component

We will keep the commonly used components in the `app/javascript/src/components/commons`
folder. Run the following command to create the `Button` component file inside the `commons`
folder:

```bash
mkdir -p app/javascript/src/components/commons
touch app/javascript/src/components/commons/Button.jsx
```

In `Button.jsx` paste the following content:

```jsx
import React from "react";

import classnames from "classnames";
import PropTypes from "prop-types";

const noop = () => {};

const Button = ({
  size = "medium",
  style = "primary",
  type = "button",
  buttonText,
  onClick = noop,
  loading,
  className = "",
  icon,
}) => {
  const handleClick = e => {
    if (!loading) return onClick(e);

    return null;
  };

  return (
    <button
      disabled={loading}
      type={type}
      className={classnames(
        [className],
        "focus:outline-none group relative flex items-center justify-center gap-x-2 rounded-md border border-transparent  text-sm font-medium leading-5 transition duration-150 ease-in-out",
        {
          "px-4 py-2": size === "medium",
          "px-2 py-1": size === "small",
          "bg-indigo-600 text-white hover:bg-indigo-700":
            !loading && style === "primary",
          "bg-gray-200 text-gray-800 hover:bg-gray-300":
            !loading && style === "secondary",
          "bg-gray-300 text-gray-800": loading,
          "cursor-wait": loading,
        }
      )}
      onClick={handleClick}
    >
      {icon && <i className={`ri-${icon} text-base`} />}
      {loading ? "Loading..." : buttonText}
    </button>
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

## GraniteLogo component

Let's create a `GraniteLogo` component to display a logo for our project as shown below:

<image>granite-logo.png</image>

We need to display the `GraniteLogo` as part of the `NavBar`. Create the `GraniteLogo` component inside the `NavBar` folder:

```bash
mkdir -p app/javascript/src/components/NavBar/
touch app/javascript/src/components/NavBar/GraniteLogo.jsx
```

Add the following lines to `GraniteLogo.jsx` file:

```jsx
import React from "react";

const GraniteLogo = props => (
  <svg
    fill="none"
    height="100"
    viewBox="0 0 325 100"
    width="325"
    xmlns="http://www.w3.org/2000/svg"
    {...props}
  >
    <path
      d="M22.2093 21.5734C25.7405 21.5734 28.8071 22.2858 31.409 23.7107C34.0729 25.1356 36.1172 27.056 37.5421 29.4721V22.2239H55.7556V73.7978C55.7556 78.6919 54.8263 83.0904 52.9678 86.9933C51.1093 90.9581 48.1976 94.1176 44.2328 96.4718C40.3299 98.8259 35.3738 100.003 29.3646 100.003C21.311 100.003 14.8682 98.1134 10.036 94.3345C5.20386 90.5555 2.44705 85.4136 1.76559 78.9087H19.7003C20.072 80.5814 21.0013 81.8824 22.4881 82.8116C23.9749 83.7409 25.8954 84.2055 28.2495 84.2055C34.4446 84.2055 37.5421 80.7363 37.5421 73.7978V67.1071C36.1172 69.5232 34.0729 71.4437 31.409 72.8686C28.8071 74.2934 25.7405 75.0058 22.2093 75.0058C18.0586 75.0058 14.2796 73.9217 10.8723 71.7534C7.52701 69.5852 4.86313 66.4876 2.88071 62.4608C0.960235 58.3721 0 53.6329 0 48.2432C0 42.8534 0.960235 38.1452 2.88071 34.1184C4.86313 30.0916 7.52701 26.9941 10.8723 24.8258C14.2796 22.6575 18.0586 21.5734 22.2093 21.5734ZM37.5421 48.2432C37.5421 44.8978 36.6128 42.2649 34.7543 40.3444C32.9578 38.424 30.7275 37.4637 28.0637 37.4637C25.3378 37.4637 23.0766 38.424 21.2801 40.3444C19.4835 42.203 18.5852 44.8359 18.5852 48.2432C18.5852 51.5885 19.4835 54.2524 21.2801 56.2348C23.0766 58.1553 25.3378 59.1155 28.0637 59.1155C30.7275 59.1155 32.9578 58.1553 34.7543 56.2348C36.6128 54.3143 37.5421 51.6504 37.5421 48.2432Z"
      fill="black"
    />
    <path
      d="M79.7015 31.4236C81.7458 28.4499 84.2239 26.0958 87.1356 24.3612C90.0472 22.6266 93.1757 21.7592 96.5211 21.7592V41.1808H91.4102C87.4453 41.1808 84.5027 41.9552 82.5822 43.5039C80.6617 45.0527 79.7015 47.7476 79.7015 51.5885V74.3554H61.488V22.2239H79.7015V31.4236Z"
      fill="black"
    />
    <path
      d="M95.4307 48.2432C95.4307 42.8534 96.3909 38.1452 98.3114 34.1184C100.294 30.0916 102.958 26.9941 106.303 24.8258C109.71 22.6575 113.489 21.5734 117.64 21.5734C121.233 21.5734 124.331 22.2858 126.933 23.7107C129.535 25.1356 131.548 27.056 132.973 29.4721V22.2239H151.186V74.3554H132.973V67.1071C131.548 69.5232 129.504 71.4437 126.84 72.8686C124.238 74.2934 121.171 75.0058 117.64 75.0058C113.489 75.0058 109.71 73.9217 106.303 71.7534C102.958 69.5852 100.294 66.4876 98.3114 62.4608C96.3909 58.3721 95.4307 53.6329 95.4307 48.2432ZM132.973 48.2432C132.973 44.8978 132.044 42.2649 130.185 40.3444C128.388 38.424 126.158 37.4637 123.494 37.4637C120.768 37.4637 118.507 38.424 116.711 40.3444C114.914 42.203 114.016 44.8359 114.016 48.2432C114.016 51.5885 114.914 54.2524 116.711 56.2348C118.507 58.1553 120.768 59.1155 123.494 59.1155C126.158 59.1155 128.388 58.1553 130.185 56.2348C132.044 54.3143 132.973 51.6504 132.973 48.2432Z"
      fill="black"
    />
    <path
      d="M191.022 21.7592C197.032 21.7592 201.802 23.7726 205.333 27.7994C208.864 31.7643 210.63 37.154 210.63 43.9686V74.3554H192.416V46.3846C192.416 43.411 191.642 41.0879 190.093 39.4152C188.544 37.6806 186.469 36.8133 183.867 36.8133C181.141 36.8133 179.004 37.6806 177.455 39.4152C175.907 41.0879 175.132 43.411 175.132 46.3846V74.3554H156.919V22.2239H175.132V29.658C176.743 27.3038 178.911 25.4143 181.637 23.9895C184.363 22.5027 187.491 21.7592 191.022 21.7592Z"
      fill="black"
    />
    <path d="M234.191 22.2239V74.3554H215.977V22.2239H234.191Z" fill="black" />
    <path
      d="M270.675 58.8367V74.3554H262.777C249.457 74.3554 242.797 67.7576 242.797 54.5621V37.3708H236.386V22.2239H242.797V9.58594H261.104V22.2239H270.582V37.3708H261.104V54.8409C261.104 56.2658 261.414 57.288 262.033 57.9075C262.715 58.527 263.83 58.8367 265.379 58.8367H270.675Z"
      fill="black"
    />
    <path
      d="M324.191 47.6856C324.191 49.1105 324.098 50.5353 323.912 51.9602H289.437C289.623 54.8099 290.397 56.9472 291.76 58.3721C293.185 59.735 294.982 60.4165 297.15 60.4165C300.185 60.4165 302.354 59.0536 303.655 56.3277H323.076C322.271 59.9209 320.691 63.1423 318.337 65.992C316.045 68.7798 313.133 70.9791 309.602 72.5898C306.071 74.2005 302.168 75.0058 297.893 75.0058C292.751 75.0058 288.167 73.9217 284.14 71.7534C280.175 69.5852 277.047 66.4876 274.755 62.4608C272.524 58.434 271.409 53.6948 271.409 48.2432C271.409 42.7915 272.524 38.0832 274.755 34.1184C276.985 30.0916 280.082 26.9941 284.047 24.8258C288.074 22.6575 292.689 21.5734 297.893 21.5734C303.035 21.5734 307.588 22.6266 311.553 24.7329C315.518 26.8392 318.616 29.8748 320.846 33.8396C323.076 37.7425 324.191 42.3578 324.191 47.6856ZM305.606 43.1322C305.606 40.902 304.863 39.1674 303.376 37.9284C301.889 36.6274 300.03 35.9769 297.8 35.9769C295.57 35.9769 293.742 36.5964 292.318 37.8354C290.893 39.0125 289.964 40.7781 289.53 43.1322H305.606Z"
      fill="black"
    />
    <circle cx="225.433" cy="9.2926" fill="#6B65F4" r="9.2926" />
  </svg>
);

export default GraniteLogo;
```

You can design logos using tools like [Figma](https://www.figma.com/) and return the corresponding `svg` as a reusable component like this.

## NavBar component

Let's create the `NavBar` reusable component:

```bash
touch app/javascript/src/components/NavBar/index.jsx
```

It's named `index.jsx` because it's the root file which will be auto-imported in
scenarios where we import like say `import NavBar from '../NavBar'`.

In `index.jsx`, paste the following content:

```jsx
import React from "react";

import classnames from "classnames";
import { Link, useLocation } from "react-router-dom";

import GraniteLogo from "./GraniteLogo";

const NavBar = () => {
  const location = useLocation();

  return (
    <header className="bg-primary-white sticky top-0 z-20 w-full border-b border-gray-200 transition-all duration-500">
      <div className="mx-auto max-w-6xl px-6">
        <div className="flex h-16 items-center justify-between">
          <div className="w-max flex-shrink-0">
            <Link className="h-full w-auto" to="/dashboard">
              <GraniteLogo className="h-8 w-auto" />
            </Link>
          </div>
          <div className="flex items-center gap-x-4">
            <Link
              to="/dashboard"
              className={classnames("text-sm font-medium text-gray-800", {
                "text-indigo-600": location.pathname === "/dashboard",
              })}
            >
              Todos
            </Link>
            <Link
              className="rounded-md bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-700 focus:shadow"
              to="/tasks/create"
            >
              Add new task
            </Link>
          </div>
        </div>
      </div>
    </header>
  );
};

export default NavBar;
```

## Container component

To create a `Container` component, run the following command:

```bash
touch app/javascript/src/components/commons/Container.jsx
```

Now, open the `Container.jsx` file and paste the following
content:

```jsx
import React from "react";

import classnames from "classnames";
import PropTypes from "prop-types";

import NavBar from "components/NavBar";

const Container = ({ children, className = "" }) => (
  <>
    <NavBar />
    <div className={classnames("mx-auto max-w-6xl px-6", [className])}>
      {children}
    </div>
  </>
);

Container.propTypes = {
  children: PropTypes.node.isRequired,
};

export default Container;
```

## Input component

To create an `Input` component, run the following command:

```bash
touch app/javascript/src/components/commons/Input.jsx
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
}) => (
  <div className="flex flex-col">
    {label && (
      <label className="block text-sm font-medium leading-none text-gray-800">
        {label}
      </label>
    )}
    <div className="mt-1 rounded-md shadow-sm">
      <input
        disabled={disabled}
        placeholder={placeholder}
        required={required}
        type={type}
        value={value}
        className={classnames(
          "focus:outline-none focus:shadow-outline-blue block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 transition duration-150 ease-in-out focus:border-blue-300 sm:text-sm sm:leading-5",
          [className]
        )}
        onChange={onChange}
      />
    </div>
  </div>
);

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

## Tooltip Component

We will make use the [`@floating-ui`](https://floating-ui.com/docs/react) package to build the `Tooltip` component.

Run the following command to add `@floating-ui` package:

```bash
yarn add @floating-ui/react@^0.26.6
```

Create the `Tooltip` component file by running the following command:

```bash
touch app/javascript/src/components/commons/Tooltip.jsx
```

In `Tooltip.jsx`, paste the following content:

```jsx
import React, { useState, useRef, cloneElement } from "react";

import {
  useFloating,
  autoUpdate,
  offset,
  flip,
  shift,
  useHover,
  useFocus,
  useDismiss,
  useRole,
  useInteractions,
  FloatingPortal,
  FloatingArrow,
  arrow,
} from "@floating-ui/react";

const Tooltip = ({ tooltipContent, children }) => {
  const [isOpen, setIsOpen] = useState(false);
  const arrowRef = useRef(null);

  const { refs, floatingStyles, context } = useFloating({
    open: isOpen,
    onOpenChange: setIsOpen,
    placement: "top",
    whileElementsMounted: autoUpdate,
    middleware: [
      arrow({
        element: arrowRef,
      }),
      offset(10),
      flip({
        fallbackAxisSideDirection: "start",
      }),
      shift(),
    ],
  });

  const hover = useHover(context, { move: false });
  const focus = useFocus(context);
  const dismiss = useDismiss(context);
  const role = useRole(context, { role: "tooltip" });

  const { getReferenceProps, getFloatingProps } = useInteractions([
    hover,
    focus,
    dismiss,
    role,
  ]);

  const elem = cloneElement(children, {
    ref: refs.setReference,
    ...getReferenceProps(),
  });

  return (
    <>
      {elem}
      <FloatingPortal>
        {isOpen && (
          <div
            className="w-max rounded-md bg-gray-800 px-3 py-2 text-xs text-white"
            ref={refs.setFloating}
            style={floatingStyles}
            {...getFloatingProps()}
          >
            {tooltipContent}
            <FloatingArrow context={context} ref={arrowRef} />
          </div>
        )}
      </FloatingPortal>
    </>
  );
};

export default Tooltip;
```

## Table component

To create a `Table` component, we will create `Row` and `Header` components:

```bash
mkdir -p app/javascript/src/components/Tasks/Table/
touch app/javascript/src/components/Tasks/Table/Row.jsx
```

In `Row.jsx`, paste the following content:

```jsx
import React from "react";

import PropTypes from "prop-types";

import { Tooltip } from "components/commons";

const Row = ({ data }) => (
  <tbody className="divide-y divide-gray-200 bg-white">
    {data.map(rowData => (
      <tr key={rowData.id}>
        <td className="border-r border-gray-300 px-4 py-2.5 text-sm font-medium capitalize">
          <Tooltip tooltipContent={rowData.title}>
            <span>{rowData.title}</span>
          </Tooltip>
        </td>
      </tr>
    ))}
  </tbody>
);

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

const Header = () => (
  <thead>
    <tr>
      <th className="border-b border-r border-gray-300 bg-gray-100 px-4 py-2.5 text-left text-xs font-bold uppercase leading-4 text-gray-800">
        Tasks
      </th>
      <th className="border-b border-r border-gray-300 bg-gray-100 px-4 py-2.5 text-left text-xs font-bold uppercase leading-4 text-gray-800">
        Assigned To
      </th>
    </tr>
  </thead>
);

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

const Table = ({ data }) => (
  <div className="inline-block min-w-full">
    <table className="min-w-full border-collapse border border-gray-300">
      <Header />
      <Row data={data} />
    </table>
  </div>
);

export default Table;
```

Now, `Table` can be imported by using following line:

```jsx
import Table from "components/Tasks/Table";
```

## PageLoader component

To create a `PageLoader` component, run the following command:

```bash
touch app/javascript/src/components/commons/PageLoader.jsx
```

In `PageLoader.jsx`, paste the following content:

```jsx
import React from "react";

import classnames from "classnames";

const PageLoader = ({ className = "" }) => (
  <div
    className={classnames(
      [className],
      "flex h-screen w-screen flex-row items-center justify-center"
    )}
  >
    <h1 className="text-lg leading-5">Loading...</h1>
  </div>
);

export default PageLoader;
```

## PageTitle component

To create a `PageTitle` component, run the following command:

```bash
touch app/javascript/src/components/commons/PageTitle.jsx
```

In `PageTitle.jsx`, paste the following content:

```jsx
import React from "react";

const PageTitle = ({ title }) => (
  <h2 className="mt-8 text-3xl font-semibold">{title}</h2>
);

export default PageTitle;
```

Now that we have defined the common components like `Button`, `Container`, etc, we will add an `index.js` file to export all the components from the `commons` folder together. This will help us avoid multiple imports, as shown below:

```js
import Button from "src/components/commons/Button";
import Container from "src/components/commons/Container";
import Input from "src/components/commons/Input";
```

Instead we can import the components in a single import:

```js
import { Button, Container, Input } from "src/components/commons";
```

Create `index.js` file:

```bash
touch app/javascript/src/components/commons/index.js
```

Add the following lines to `index.js` file:

```bash
import Button from "./Button";
import Container from "./Container";
import Input from "./Input";
import PageLoader from "./PageLoader";
import PageTitle from "./PageTitle";
import Tooltip from "./Tooltip";

export { Button, Container, Input, PageLoader, PageTitle, Tooltip };
```

Now let's commit these changes:

```bash
git add -A
git commit -m "Added reusable components"
```

## References

- [Type Checking with React](https://reactjs.org/docs/typechecking-with-proptypes.html)
- [Reusability with React Components](https://medium.com/walmartglobaltech/how-to-achieve-reusability-with-react-components-81edeb7fb0e0)
- [A Quick Intro in React Children](https://codeburst.io/a-quick-intro-to-reacts-props-children-cb3d2fce4891)
