
In the previous lesson, we integrated Formik into the SmileCart application, allowing us to manage form state seamlessly. In this chapter, we're diving deeper into enhancing our form handling capabilities by introducing Yup validations in conjunction with Formik.

## Introduction to Yup

[Yup](https://www.npmjs.com/package/yup) is a JavaScript library that provides a simple and efficient way to validate the shape and structure of data. It allows you to define schemas with rules that your data must adhere to, making it easier to handle validation in your applications.

## Benefits of using Yup

The following points articulate why using Yup is beneficial:

-  Data integrity and validation: Yup ensures that the data entered into forms adheres to specific rules and structures. This validation prevents the submission of incorrect or incomplete data, maintaining the integrity of the application's data.

- Simplified validation logic: Yup's schema-based approach allows developers to declare validation requirements concisely, making the code more readable and maintainable.

- Error Handling and Debugging: Yup provides detailed error messages when validation fails, making it easier for developers to identify and address issues. These error messages can be customized to offer clear guidance to users about what went wrong.

- Consistency Across the Application: Using Yup promotes consistency in data validation throughout the application. Developers can define centralized schemas and reuse them across different components, ensuring uniform validation standards.

- Integration with frameworks: Yup integrates seamlessly with popular frontend frameworks like React, making it a preferred choice for form validation within these ecosystems.

To install Yup into our application, execute the following command:

```bash
yarn add yup@^0.32.11
```

## Creating a schema

To perform validation with Yup, we need to define a schema. A schema represents the structure of our data along with the validation rules. Let's systematically construct a schema for the checkout form.

In the `constants.js` file, create a constant `CHECKOUT_FORM_VALIDATION_SCHEMA` to store the schema.

As the form values are enclosed  in a object, we will use `yup.object()` to specify that the validated data should adhere to an object structure. We will then chain it with `.shape()` to articulate the object's composition and impose validation regulations on its properties. In our case, the object property within `.shape()` will represent the fields subject to validation.

```jsx
import { t } from "i18next";
import * as yup from "yup";

export const CHECKOUT_FORM_VALIDATION_SCHEMA = yup.object().shape({
});
```

Now lets add validations for each field.

For the `email` field, our goal is to validate it as a mandatory input in a valid email address format. This involves using `.string()` to ensure the input is a string, `.email()` to verify its adherence to a valid email format, and `.required()` to mandate its completion.

```jsx
export const CHECKOUT_FORM_VALIDATION_SCHEMA = yup.object().shape({
  email: yup
    .string()
    .email(t("validations.emailInvalid"))
    .required(t("validations.emailRequired")),
});
```

Moving on to the `country` object, we need to guarantee that both `name` and `code` fields are strings and obligatory. We'll allow the entire country object to be nullable, ensuring this flexibility using the `.nullable()` method.

```jsx
export const CHECKOUT_FORM_VALIDATION_SCHEMA = yup.object().shape({
  // ...
  country: yup
    .object()
    .shape({
      name: yup.string().required(),
      code: yup.string().required(),
    })
    .nullable(),
});
```

Regarding the `firstName`, `lastName`, `address`, `apartment`, and `city` fields, they should all be strings and mandatory for submission.

```jsx
export const CHECKOUT_FORM_VALIDATION_SCHEMA = yup.object().shape({
  // ...
  firstName: yup.string().required(t("validations.firstNameRequired")),
  lastName: yup.string().required(t("validations.lastNameRequired")),
  address: yup.string().required(t("validations.addressRequired")),
  apartment: yup.string().required(t("validations.apartmentRequired")),
  city: yup.string().required(t("validations.cityRequired")),
});
```

Next, we will validate the structure of the state object, ensuring both `name` and `code` fields will be strings and required. While the state object can be nullable, the `state` field itself should be mandatory.

```jsx
export const CHECKOUT_FORM_VALIDATION_SCHEMA = yup.object().shape({
  // ...
  state: yup
    .object()
    .shape({
      name: yup.string().required(),
      code: yup.string().required(),
    })
    .nullable()
    .required(t("validations.stateRequired")),
});
```

Lastly, `zipCode` is expected to be a number and is mandatory. This validation can be ensured using the `.number() `and `.required()` methods.

```jsx
export const CHECKOUT_FORM_VALIDATION_SCHEMA = yup.object().shape({
  // ...
  zipCode: yup.number().required(t("validations.zipCodeRequired")),
});
```

That concludes our validation schema design. Now let's proceed to pass in this validation schema as formik prop in the `Checkout` component.

```jsx {4, 16}
// ...
import {
  CHECKOUT_FORM_INITIAL_VALUES,
  CHECKOUT_FORM_VALIDATION_SCHEMA,
} from "./constants";
// ...

const Checkout = () => {
  // ...

  return (
    <NeetoUIForm
      formProps={{ noValidate: true }}
      formikProps={{
        initialValues: CHECKOUT_FORM_INITIAL_VALUES,
        validationSchema: CHECKOUT_FORM_VALIDATION_SCHEMA
      }}
    >
    // ...
    </NeetoUIForm>
  );
};

export default withTitle(Checkout, i18n.t("checkout"));
```

Finally, we'll include all the necessary translation keys in the `en.json` file.

```json
{
  // ..
  "validations": {
    "emailRequired": "Email address is required",
    "firstNameRequired": "First name is required",
    "lastNameRequired": "Last name is required",
    "addressRequired": "Address is required",
    "apartmentRequired": "Apartment is required",
    "cityRequired": "City is required",
    "stateRequired": "State is required",
    "zipCodeRequired": "Zip code is required",
    "emailInvalid": "Email address is invalid"
  },
}
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Implemented yup validation for checkout form"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/76a6b78253560dff60e7534f0cf06fbb7268a2ac).
