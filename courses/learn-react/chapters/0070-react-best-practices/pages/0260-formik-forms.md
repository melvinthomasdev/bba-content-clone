At BigBinary we use [Formik](https://formik.org/) for all forms. It takes care
of validation, errors and the form submission without compromising with
flexibility and performance.

## Validation in Formik

In Formik, validation is performed based on a validation schema. You can change
when validation occurs using the `validateOnChange` and `validateOnBlur` props.

If `validateOnChange` is true then the validation runs if the value inside a
field is changed. It is `true` by default.

If `validateOnBlur` is true then the validation runs when a form is touched.
`touched` is an attribute of the Formik forms that refers to whether the form is
interacted with. It is set to true if a click event is encountered within the
form field and only when we focus anywhere outside of it simultaneously.
`validateOnBlur` is `true` by default.

So to sum up, `validateOnChange` and `validateOnBlur` props are by default set to `true`. The validation will occur when the value is updated or a `blur` event occurs for a form field.

Let's see an example for `blur` event.

<image>selected-input-field.jpg</image>

So currently the input field for entering `Title` is selected in the above example. When we click outside of this selected field, the `blur` event would be triggered for that field. For more details about the `blur` event check [this section](https://developer.mozilla.org/en-US/docs/Web/API/Element/blur_event) from the MDN docs.

Refer to the
[official documentation](https://formik.org/docs/guides/validation) of Formik
for more information on this.

From a UX perspective, we want the validation to run as soon as an input is entered, rather than waiting until the form is submitted. This type of validation is called eager validation.

Here, the first validation only happens when the user leaves the input field(`onBlur` event) and then if the input is invalid, then we aggressively show inline validations until the input is valid. The main goal of eager validation is to provide a better user experience by catching errors early and preventing the user from having to submit a form multiple times.

By resorting to the default Formik settings, i.e, with both `validateOnBlur` and `validateOnChange` set to `true`, we will be able to incorporate eager validation into our application.

Take a look at the login form from
[Wheel](https://github.com/bigbinary/wheel/blob/master/app/javascript/src/components/Authentication/Login.jsx):

```jsx
import React from "react";

import { Form, Formik } from "formik";
import { Button } from "neetoui";
import { Input } from "neetoui/formik";
import PropTypes from "prop-types";

import authenticationApi from "apis/authentication";
import {
  SIGNUP_PATH,
  RESET_PASSWORD_PATH,
  DASHBOARD_PATH,
} from "components/routeConstants";
import { useAuthDispatch } from "contexts/auth";
import { useUserDispatch } from "contexts/user";

import {
  LOGIN_FORM_INITIAL_VALUES,
  LOGIN_FORM_VALIDATION_SCHEMA,
} from "./constants";

const Login = ({ history }) => {
  const authDispatch = useAuthDispatch();
  const userDispatch = useUserDispatch();

  const handleSubmit = async ({ email, password }) => {
    try {
      const {
        data: { auth_token, user, is_admin },
      } = await authenticationApi.login({ email, password });
      authDispatch({ type: "LOGIN", payload: { auth_token, email, is_admin } });
      userDispatch({ type: "SET_USER", payload: { user } });
      history.push(DASHBOARD_PATH);
    } catch (error) {
      logger.error(error);
    }
  };

  return (
    <div className="flex h-screen w-screen flex-row items-center justify-center overflow-y-auto overflow-x-hidden bg-gray-100 p-6">
      <div className="mx-auto flex h-full w-full flex-col items-center justify-center sm:max-w-md">
        <h2 className="mb-5 text-center text-3xl font-extrabold text-gray-800">
          Sign In
        </h2>
        <Formik
          initialValues={LOGIN_FORM_INITIAL_VALUES}
          onSubmit={handleSubmit}
          validationSchema={LOGIN_FORM_VALIDATION_SCHEMA}
        >
          {({ isSubmitting }) => (
            <Form className="w-full space-y-6 rounded-md border bg-white p-8 shadow">
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
              />
            </Form>
          )}
        </Formik>
        <div className="mt-4 flex flex-col items-center justify-center space-y-2">
          <div className="flex flex-row items-center justify-start space-x-1">
            <p className="font-normal text-gray-600">Don't have an account?</p>
            <Button
              label="Signup"
              style="link"
              to={SIGNUP_PATH}
              data-cy="sign-up-link"
            />
          </div>
          <Button
            label="Forgot password?"
            style="link"
            to={RESET_PASSWORD_PATH}
            data-cy="forgot-password-link"
          />
        </div>
      </div>
    </div>
  );
};

Login.propTypes = {
  history: PropTypes.object,
};

export default Login;
```

In the above component, even if we do not state it explicitly, the `validateOnBlur` and `validateOnChange` props in the `Formik`
component are set to true.

## Formik cancel button type

Let's consider a scenario where we have a Formik form to edit some details and the input fields already have some initial values assigned to them.
At the end of the form, we have two buttons one to submit the form and the other to cancel the edit operation.

The submit button has a `type` prop with a value of `submit` which takes care of performing the required action after it's clicked.
For example:

```jsx
<Button type="submit" label="Submit" />
```

But usually, we don't have this `type` prop for the cancel button. And in this case, this is not right because this cancel button should reset the changes in the form values as we have canceled the edit operation. We can make this cancel button reset the values of the form by assigning the `type` prop a value of `reset`.

In cases like these when the user is on the same page after clicking on the cancel button and form values needed to be reset we can update our cancel button to perform the reset action, like so:

```jsx
<Button type="reset" label="Cancel" />
```

There are some cases where we have handled the reset form action outside of `jsx`. In these cases, we shouldn't pass the `type` prop a `reset` value.

For example:

```jsx
<Button label="Cancel" onClick={resetFormValues} />
```

In the above example, we have already handled the form reset operation by a function called `resetFormValues` and therefore we shouldn't use the `reset` value for `type` prop.

## Required fields

There are some fields in the form which are required for the form submission. They are usually represented by an asterisk mark that is `*` on their label. An example:

<image>required-input.jpg</image>

We can have this same UI by using the asterisk mark in the label, like so:

```js
<Input label="Title*" name="title" />
```

But this is the wrong way. In neetoUI components, we can add a `required` prop which will add the asterisk mark on the label.

For example:

```js
<Input required label="Title" name="title" />
```
