## Button vs anchor tag for routing

People often use the button element for in-app navigation in React like so:

```jsx
<button onClick={() => history.push("/about")}>About</button>
```

Rather than using a button for navigation, you should use the `Link` or
`NavLink` components from `react-router-dom`. Both of these use the history API
under the hood. It is more declarative and looks cleaner.

A button element should be used for performing an action such as submitting a
response.

It is worth noting that the `Button` component from neetoUI library provides the
`to` prop which accepts a `path`. You can use this component for in-app
navigation. Under the hood, the `Button` component renders a `Link` element if a
path is provided to the `to` prop.

## Separation of concerns

Separation of concerns is a practice of separating an application into distinct
sections, so that each section addresses a separate concern. At its essence, the
overall goal of separation of concerns is to establish a well-organized system
where each part fulfills a meaningful and intuitive role while maximizing its
ability to adapt to change.

In React each component should contain only the logic which is relevant to that
particular component. Entities like helper functions or validation schemas
should be declared inside a separate file and then imported for use within the
component.

In the next section we will see a practical example of how to achieve this.

## Keeping the presentation logic clean

As discussed in the previous section, we should keep the presentation logic
clean. Presentation logic basically refers to the logic that renders the UI.
This includes the JSX and state but not the helper functions and the validation
schemas.

It is stressed upon to keep this presentation logic clean because clamming too
much into a single component can lead to incomprehensible code. It can also
increase opportunities for confusion. Hence a component should only contain the
logic which cannot be declared in a separate file and then exported for use. For
example, the component state and hooks.

At BigBinary, we use [yup](https://www.npmjs.com/package/yup) for validating the
form values. Yup requires you to declare a validation schema. Sometimes
developers declare the validation schema inside the form component itself which
is incorrect. It is polluting the component. This validation schema is a
constant so it should be declared in a separate file meant for constants.

Consider the following component that renders the UI for a login page:

```jsx
import React, { useState } from "react";

import { Form, Formik } from "formik";
import * as yup from "yup";
import { Button } from "neetoui";
import { Input } from "neetoui/formik";
import PropTypes from "prop-types";

import authenticationApi from "apis/authentication";

const Login = ({ history }) => {
  const [submitted, setSubmitted] = useState(false);

  const VALIDATION_SCHEMA = yup.object().shape({
    email: yup.string().email("Invalid email address").required("Required"),
    password: yup.string().required("Required"),
  });

  const INITIAL_FORM_VALUES = {
    email: "",
    password: "",
  };

  const handleSubmit = async ({ email, password }) => {
    try {
      const {
        data: { auth_token, user, is_admin },
      } = await authenticationApi.login({ email, password });
      history.push(DASHBOARD_PATH);
    } catch (error) {
      logger.error(error);
    }
  };

  return (
    <div className="flex flex-row items-center justify-center w-screen h-screen p-6 overflow-x-hidden overflow-y-auto bg-gray-100">
      <div className="flex flex-col items-center justify-center w-full h-full mx-auto sm:max-w-md">
        <h2 className="mb-5 text-3xl font-extrabold text-center text-gray-800">
          Sign In
        </h2>
        <Formik
          initialValues={INITIAL_FORM_VALUES}
          validateOnBlur={submitted}
          validateOnChange={submitted}
          onSubmit={handleSubmit}
          validationSchema={VALIDATION_SCHEMA}
        >
          {({ isSubmitting }) => (
            <Form className="w-full p-8 space-y-6 bg-white border rounded-md shadow">
              <Input
                required
                name="email"
                label="Email"
                type="email"
                placeholder="oliver@example.com"
                data-cy="login-email-text-field"
              />
              <Input
                required
                name="password"
                label="Password"
                type="password"
                placeholder="******"
                data-cy="login-password-text-field"
              />
              <Button
                fullWidth
                type="submit"
                label="Login"
                data-cy="login-submit-button"
                className="h-8"
                loading={isSubmitting}
                disabled={isSubmitting}
                onClick={() => setSubmitted(true)}
              />
            </Form>
          )}
        </Formik>
      </div>
    </div>
  );
};

export default Login;
```

In the above code, validation schema and initial form values need not be
declared inside the component. Doing so makes the component look inflated in
size and every time the component re-renders these are declared again. Although
there is no effect on performance because of re-declaration in this case but in
a large component this can lead to some performance drop.

Hence it is a good practice to keep the presentation layer i.e. the component
clean. Extract the constants out of the component and move them to a constants
file like so:

```jsx
// Login.jsx

import React, { useState } from "react";

import { Form, Formik } from "formik";
import { Button } from "neetoui";
import { Input } from "neetoui/formik";
import PropTypes from "prop-types";

import authenticationApi from "apis/authentication";

import { VALIDATION_SCHEMA, INITIAL_FORM_VALUES } from "./constants";

const Login = ({ history }) => {
  const [submitted, setSubmitted] = useState(false);

  const handleSubmit = async ({ email, password }) => {
    try {
      const {
        data: { auth_token, user, is_admin },
      } = await authenticationApi.login({ email, password });
      history.push(DASHBOARD_PATH);
    } catch (error) {
      logger.error(error);
    }
  };

  return (
    <div className="flex flex-row items-center justify-center w-screen h-screen p-6 overflow-x-hidden overflow-y-auto bg-gray-100">
      <div className="flex flex-col items-center justify-center w-full h-full mx-auto sm:max-w-md">
        <h2 className="mb-5 text-3xl font-extrabold text-center text-gray-800">
          Sign In
        </h2>
        <Formik
          initialValues={INITIAL_FORM_VALUES}
          validateOnBlur={submitted}
          validateOnChange={submitted}
          onSubmit={handleSubmit}
          validationSchema={VALIDATION_SCHEMA}
        >
          {({ isSubmitting }) => (
            <Form className="w-full p-8 space-y-6 bg-white border rounded-md shadow">
              <Input
                required
                name="email"
                label="Email"
                type="email"
                placeholder="oliver@example.com"
                data-cy="login-email-text-field"
              />
              <Input
                required
                name="password"
                label="Password"
                type="password"
                placeholder="******"
                data-cy="login-password-text-field"
              />
              <Button
                fullWidth
                type="submit"
                label="Login"
                data-cy="login-submit-button"
                className="h-8"
                loading={isSubmitting}
                disabled={isSubmitting}
                onClick={() => setSubmitted(true)}
              />
            </Form>
          )}
        </Formik>
      </div>
    </div>
  );
};

export default Login;

// constants.js

export const VALIDATION_SCHEMA = yup.object().shape({
  email: yup.string().email("Invalid email address").required("Required"),
  password: yup.string().required("Required"),
});

export const INITIAL_FORM_VALUES = {
  email: "",
  password: "",
};
```

Similarly you should keep any helper functions out of the component and import
them from a `utils.js` file.

Before we move ahead it is worth pointing out that we should always import `yup`
in lowercase as it is imported as an object. Only classes and components should
be imported in Pascal case. And constants should be imported as they are
declared.

## Single responsibility principle in functions

A function should only be responsible for performing tasks as its name suggests.
For example, a function named `redirectToLoginPage` should only be responsible
for redirecting to the login page.

The following example depicts a poor example of the single responsibility
principle in a Javascript function:

```javascript
const redirectToLoginPage = () => {
  if (user) return false;

  window.location.href = "/login";
};
```

In the above example, the function is checking if the user exists and if it does
not then it redirects to the login otherwise it returns `false`. It is not a
good pattern because the `if` condition does not belong inside the function. The
condition should be moved out and if the condition is not satisfied then the
`redirectToLoginPage` function should be called like so:

```javascript
const redirectToLoginPage = () => {
  window.location.href = "/login";
};

if (!user) redirectToLoginPage();
```

If we need to run side effects such as checking if the user exists then the
function should be named `checkAndRedirectToLoginPage`.

Following the single responsibility principle provides the following benefits:

- It makes your code reusable and versatile. As the application grows, you will
  notice that often two different parts of your code perform a similar task.
  When that happens, you could break the code down into functions with each
  function performing a single task and then piece them together and reuse them
  wherever you need.

- It makes it easier to troubleshoot any current and future issues that may
  appear. Think of it like this, a machine that performs multiple tasks breaks
  down and to fix it, you need to dismantle it and check for the issue. Now
  consider a scenario where the machine is built up of attachable parts. In this
  case if the machine breaks then you can just take out the faulty part and fix
  it or swap it with a new one.

  Similarly for functions, if each function performs a specific task and if the
  whole component is built up of multiple such functions then it is easier to
  troubleshoot inside the component and fix the specific function that might be
  causing the error.

## Splitting components into child components

Often the presentation logic of a component can grow big in size as the
application grows which increases complexity and interferes with code
maintainability and readability. To overcome this, larger components can be
split into smaller child components.

For example, consider a component called `Dashboard` which renders a table along
with some other UI elements. In this case, the job of rendering the table can be
delegated to a new `Table` component declared inside the `Dashboard` component's
directory and the `Table` component can be imported and used inside the
`Dashboard` component.

## When not to create a new component

When the JSX code is tightly coupled with its parent component, do not try to move it to a new file. We will need to pass in every dependent value to it as props and it will make the code harder to read. This is an example:

```jsx
const ParentComponent = () => {
  // multiple states and value declarations
  return (
    <ChildComponent
      user={user}
      setUser={setUser}
      order={order}
      setOrder={setOrder}
      // ...and so on
    />
  );
};
```

Here, the initialization & management of the states `user`, `order`, etc are done on `ParentComponent` while its usage is on `ChildComponent`. The reader will need to continuously navigate between this files while working on some features related to this. It will be counter productive.

But do note that like everything else in the field of Software Engineering, there are exceptions to this rule too. Like there can be cases where the component's presentation layer is becoming too large such that it affects readability and more than that makes it less debuggable. In such cases, it would very much make sense to create sub-components.

## Avoid code repetition

Code repetition is a bad practice and it should be avoided. The biggest
disadvantage of code repetition is that it makes your code difficult to
maintain. If a function is repeated in multiple places then any update to the
function will need to be made in all the places where it is repeated. Code
repetition can also make your code bulky. Take a look at the following example:

```jsx
// Display.jsx
import React from "react";

const Display = ({ text }) => {
  const hyphenateString = string => string.split(" ").join("-");

  return <p>{hyphenateString(text)}</p>;
};

export default Display;

// Home.jsx
import React from "react";

const Home = ({ title }) => {
  const hyphenateString = string => string.split(" ").join("-");

  return <h2>{hyphenateString(title)}</h2>;
};

export default Home;
```

In the above example, the `hyphenateString` function is declared multiple times.
Any change to the function would have to be made separately at all instances
where the function has been declared. This leads to less maintainable code.

A better alternative would have been to declare the `hyphenateString` function
inside a `utils.js` file and then import that function to be used wherever
required. At BigBinary we use the `utils.js` file to declare utility functions
common for multiple components.

Let us consider another example of code repetition:

```javascript
const marksObtained = 20;

function assignGradeAndPrintResult(marksObtained) {
  if (marksObtained > 60) {
    printResult();
    assignPassingGrade();
  } else {
    printResult();
    assignFailingGrade();
  }
}

assignGradeAndPrintResult(marksObtained);
```

In the above example, the `printResult` function is invoked regardless of the
marks obtained. In such cases the `printResult` function could have been invoked
once, and that should be before the if/else blocks even starts, like so:

```javascript
function assignGradeAndPrintResult(marksObtained) {
  printResult();
  if (marksObtained > 60) {
    assignPassingGrade();
  } else {
    assignFailingGrade();
  }
}
```

## Rendering strings and blank spaces in JSX

One of the common mistakes that developers make is using template literals
inside curly braces in JSX like so:

```jsx
import React from "react";

const Display = () => {
  const message = "Hello World";

  return <p>{`${message}`}</p>;
};

export default Display;
```

In the above code it is not required to use template literals because anything
inside curly braces in JSX is evaluated as an expression. Hence the above code
could be written correctly like so:

```jsx
import React from "react";

const Display = () => {
  const message = "Hello World";

  return <p>{message}</p>;
};

export default Display;
```

To render a blank character, you should use `&nbsp;` escape character like so:

```jsx
import React from "react";

const Display = () => <p>Hello&nbsp;World</p>;

export default Display;
```

The above code will render "Hello World".

## Declaring boolean props

We know that data is passed down from one component to another through props.
Some of the attributes inside props might contain boolean values. Rather than
declaring these attributes and passing a boolean value you should just pass the
attribute name if its value is true or skip it if the value it contains is
false. For example:

```jsx
<Table required={true} loading columns={["header", "value"]} />
```

In the above example, the value of `required` prop is true. Rather than passing
`required={true}` you can simply mention `required`. This is also called
implicit declaration of props. Above example can be refactored like so:

```jsx
<Table required loading columns={["header", "value"]} />
```

React will infer from the presence of the `required` attribute that its value is
supposed to be true. If it is not present then the inferred value of the
`required` attribute will be false.

Also note that these implcitily `true` attributes ought to be the first among the list of
attributes being passed down as props because it gives a better visual hierarchy
and also these are the props that don't change often.

## Don't add unnecessary blank lines

Adding blank lines in JSX is a big anti-pattern. It doesn't help visually by any means.
JSX is the presentation layer and adding blank lines in that layer can cause confusion
to the reader.

```js
// Incorrect code
return (
 <div className="p-10">
   <p>Block1</p>
 </div>

  <div className="p-10">
   <p>Block2</p>
 </div>
)

// Correct code
return (
 <div className="p-10">
   <p>Block1</p>
 </div>
  <div className="p-10">
   <p>Block2</p>
 </div>
)
```

But this doesn't mean that you shouldn't add any blank lines at all in your codebase.
We have only mentioned to NOT add blank lines in JSX. But it's perfectly valid to
add blank lines in JS code to provide visual hierarchy. Example:

```js
// Incorrect
const [state, setState] = useState(true);
return (
  <p>Block</p>
);

// Correct - blank lines should be added before return statements
const [state, setState] = useState(true);

return (
  <p>Block</p>
);
```

## Prefer day.js over inbuilt date functions

[Day.js](https://day.js.org/docs/en/parse/parse) is a minimalist JavaScript library that parses, validates, manipulates, and displays dates and times for modern browsers with a largely Moment.js-compatible API. All API operations that change the Day.js object will return a new instance instead. This helps prevent bugs and avoid long debugging sessions.

## How to extend day.js?

We should have all the extension logic together and separate from the other business logic. The `dayjs` instance is global so once we extend it we can use that extension in any of the `dayjs` instances in the project. We should keep our extension logic for `dayjs` inside the `src/lib/dayjs.js` file.

Let's understand with an example. Say we want to extend our `dayjs` instance with the `relativeTime` plugin. Create a file named `dayjs.js` inside the `src/lib` directory.

Add the following lines in `dayjs.js`:

```js
import dayjs from "dayjs";
import relativeTime from "dayjs/plugin/relativeTime";

dayjs.extend(relativeTime);

export default dayjs;
```

We have extended the `dayjs` instance with `relativeTime` plugin. We can add all the required extensions inside this `dayjs.js` file. Now, we need to import the above mentioned file into the entry or root point of the application, like App.jsx.

We can import the `dayjs.js` file like so:

```js
import "lib/dayjs"; // eslint-disable-line
```

We didn't import the module like `import dayjs from "lib/dayjs"` because we don't have any use case for the `dayjs` instance within this file, that is App.jsx. Here our aim is to ensure that we initialize or extend the global `dayjs` instance. We have disabled the eslint for the import statement to remove the false eslint error for the placement of the import statement.

After making the above import we have extended the `dayjs` instance with the `relativeTime` plugin. Now let's say we want to use this `dayjs` instance in some other file, like say `utils.js`.

We can import and use the `dayjs` instance in `utils.js` like so:

```js
import dayjs from "dayjs";

export const calculateCreatedAgo = date => dayjs(date).fromNow();
```

As you can see in the above code block we have imported `dayjs` from the node modules path itself rather than from `lib/dayjs`. That is because we have already extended the `dayjs` properties globally and can use them with any `dayjs` instance. The `fromNow()` method used in the above example is included in the `relativeTime` plugin. As we had already extended `relativeTime` with `dayjs` we can use `fromNow()` with `dayjs` as shown in the above example.

In the above example for importing the `dayjs` file from the `lib` directory, we have used the "lib/dayjs" path. This is because we have added alias for `lib` in the Webpack config file like so:

```js
resolve: {
  alias: {
    lib: "src/lib"
  }
}
```

After defining the alias for the lib folder we can import from lib like so:

```jsx
// Incorrect import
import "../../lib/dayjs";

// Correct import
import "lib/days";
```

To know more about Webpack alias please check [this chapter](https://courses.bigbinaryacademy.com/learn-react/react-best-practices/create-alias-for-commonly-used-directories/) from React best practices. As the project grows and we extend multiple third party packages adding an alias for the `lib` directory helps in using the `lib` folder in different files efficiently. We should always define an alias for commonly used directories like `lib`, `apis`, etc. There are many use cases of the `lib` directory which are listed in [this section](/learn-rubyonrails/more-rails-content-and-goodies#the-lib-folder-and-its-use-cases) of `Learn Ruby on Rails book`.

## Positional parameters vs Named parameters

When defining a function we can either use named parameters or positional parameters. But in most of the cases we should be using named parameters.

This is how these parameters look like:

```js
// Positional parameters
const listUsers = (projectId, includeInactive, withContactInfo) => {
  // rest of the code
};

// Named parameters
const listUsers = ({ projectId, includeInactive, withContactInfo }) => {
  // rest of the code
};
```

In the case of positional parameters, the function will be receiving three values in its parameters. Each parameter of the function has a position. So `projectId` is at position 1, `includeInactive` is at position 2, and so on.

These values are order dependent. That means `listUsers(1, true, true)` is not same as `listUsers(true, 1, true)`. This means that the developer who is dealing with this function should always be aware of the position of the parameters of this function, which is a burden that can be avoided.

In the case of named parameters, the function will be receiving one object containing key-value pairs. From that object, we will destructure the arguments. Now the arguments are not order dependent that means `listUsers({ projectId: 1, includeInactive: true, withContactInfo: true })` is same as `listUsers({ withContactInfo: true, projectId: 1, includeInactive: true })`. Thus here, named parameters have reduced the burden from the developer.

So if we are having more than one parameter in the function then we should prefer named parameters because:

- The parameters of the function are not order dependent and hence the developer doesn't have to worry about the order of arguments while invoking the function.

- It makes the code cleaner and readable, for example:

```js
// Positional parameters
listUsers(1, true, true);

// Named parameters
listUsers({ projectId: 1, includeInactive: true, withContactInfo: true });
```

In the case of positional parameters, the arguments are ambiguous whereas in the case of named parameters we get the information about the arguments we are passing.

- We can define cleaner default arguments, for example:

Let's say we have set a default value for the `includeInactive` parameter, like so:

```js
// Positional parameters
const listUsers = (projectId, includeInactive = true, withContactInfo) => {
  // rest of the code
};

// Named parameters
const listUsers = ({ projectId, includeInactive = true, withContactInfo }) => {
  // rest of the code
};
```

Now after defining the default argument we can invoke the function like so:

```js
// Positional parameters
listUsers(1, undefined, true);

// Named parameters
listUsers({ projectId: 1, withContactInfo: true });
```

Even after setting the default parameter in the case of positional parameters we have to pass `undefined` because parameters are dependent on position. Whereas in the case of named parameters we can avoid that.

- The autocompletion and linting will be much more enhanced in the text editor.

But this doesn't mean we should never prefer positional parameters. If we have only one parameter in the function then we can use positional parameters, for example:

```js
const listUsers = projectId => {
  // rest of the code
};
```
