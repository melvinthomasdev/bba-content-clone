Localization refers to the process of adaptation of an application to meet the
linguistic requirements of a specific region. In simple terms, if the default
language of an application isEnglish, then with proper localization support the
application can also be accessed in another language, say French.

## Setting up localization in projects

You can use the [i18next](https://www.i18next.com/) and
[react-i18next](https://www.npmjs.com/package/react-i18next) libraries to add
localization support in your React application. The `i18next` library provides
all the translation functionalities while `react-i18next` is a powerful
internationalization framework for React which is based on `i18next`. It
provides multiple components to assert that needed translations get loaded.

Let's go through the process of adding localization support in your React app in
a step by step manner.

**Step 1:** Install the required packages using the following command:

```bash
yarn add react-i18next i18next
```

**Step 2:** Now setup a configuration file for `i18next`. Create a file called
`i18n.js` inside the `src/common` directory using the following command:

```bash
touch app/javascript/src/common/i18n.js
```

Also create a json file inside the `src/translation` directory which will
contain the translation strings using the following command:

```bash
mkdir -p app/javascript/src/translation
touch app/javascript/src/translation/en.json
```

Add the following content to the `i18n.js` configuration file:

```javascript
import i18n from "i18next";
import { initReactI18next } from "react-i18next";

import en from "../translations/en.json";

i18n.use(initReactI18next).init({
  resources: {
    en: {
      translation: en,
    },
  },
  lng: "en",
  fallbackLng: "en",
  interpolation: {
    escapeValue: false,
  },
});

export default i18n;
```

Invoking the `use` function loads and binds any plugins to the `i18n` object
from the `i18next` library. We are binding the `initReactI18next` object
provided by `react-i18next` to the `i18n` object. This ensures that various
components of the `react-i18next` will have access to the `i18n` object which is
required for translation.

We are then initializing our configuration by calling the `init` function. The
`init` function accepts an object which contains the configuration in key-value
pairs.

`resources` key should contain an object of resources for various languages. For
example, `en` is the ISO code for english language and it contains the
translation strings for the english language. The translation strings as
mentioned earlier are declared inside the `en.json` file and then imported for
use inside the configuration file.

`lng` option specifies the language to use and `fallback` option ensures to
fallback to a language in case the translation strings are not present.

Interpolation is one of the most used functionalities in localization. It allows
integrating dynamic values into your translation strings. By default the
interpolation values get escaped to mitigate XSS attacks. To prevent that we
have declared `escapeValue: false` as an option.

Another reason to escape the interpolation values is to allow rendering special
characters like `&` or `$`. If we don't escape the values then instead of the
special characters an equivalent HTML entity will be rendered. For example, in
place of `&`, `amp;` will be rendered in the translated string.

For more configuration options, please refer to the
[official documentation](https://www.i18next.com/overview/configuration-options)
of `i18next.`

**Step 3**: To use the translation strings inside React components, we can
either use the `withTranslation` higher order component or the `useTranslation`
hook from `react-i18next`. `withTranslation` higher order component can be used
like this:

```jsx
import React from "react";

import { withTranslation } from "react-i18next";

const Display = ({ t }) => <p>{t("example_text")}</p>;

export default withTranslation()(Display);
```

In the above component, `t` is a method from the `i18next` library which is
available as a prop inside the `Display` component because the `Display`
component is called inside the `withTranslation` higher order component. If you
recall, while configuring `i18next` we bound the `initReactI18next` object from
`react-i18next` with the `i18next` library so that the translation functions
from `i18next` can be accessed inside the components from `react-i18next`.

You can also use the `useTranslation` hook from the `react-i18next` library like
so:

```jsx
import React from "react";

import { useTranslation } from "react-i18next";

const Display = () => {
  const { t } = useTranslation();

  return <p>{t("example_text")}</p>;
};

export default Display;
```

Now add the required translation string inside the `en.json` file like this:

```json
{
  "example_text": "This is a translated text."
}
```

## Interpolation in translation strings

In the previous section we saw how to translate a simple string. In this section
we will take a look at how to translate strings with a dynamic part. Suppose the
string to be translated contains a name or a number and the name is dynamic. In
such a case, the string can be translated like this:

```jsx
import React from "react";

import { useTranslation } from "react-i18next";

const Display = ({ userName }) => {
  const { t } = useTranslation();

  return <p>{t("user_name", { name: userName })}</p>;
};

export default Display;
```

Now add the required translation inside the `en.json` file like this:

```json
{
  "user_name": "User name is {{name}}"
}
```

## Translating a string inside an HTML tag

It is often required to translate a string which contains an HTML node like
`strong` or `a` tags. Consider the following component where the entire string
inside the `p` tag including the content of the `strong` tag needs to be
translated:

```jsx
import React from "react";

const Display = () => (
  <p>
    This is the <strong>important part</strong>
  </p>
);

export default Display;
```

To translate a string which includes an HTML tag we can use the `Trans`
component from the `react-i18next` library like this:

```jsx
import React from "react";

import { Trans } from "react-i18next";

const Display = () => (
  <p>
    <Trans i18nKey="important">
      This is the <strong>important part</strong>
    </Trans>
  </p>
);

export default Display;
```

If we break down the content of `Trans` component into children then the string
`This is the` would be at position `0` and the `strong` node would be at
position `1`. Keep the position of `strong` in mind as we will need to mention
it inside the translation string.

Add the required translation inside the `en.json` file like this:

```json
{
  "important": "This is the <1>important part </1>"
}
```

There is an alternate syntax of the `Trans` component which we can use to save
us the trouble of guessing the index numbers. Instead of the numbered tags
inside the translation string we can use simpler named tags like this:

```jsx
import React from "react";

import { Trans } from "react-i18next";

const Display = () => (
  <p>
    <Trans
      i18nKey="important" // This is optional
      defaults="This is the <bold>important part</bold>"
      components={{ bold: <strong /> }}
    />
  </p>
);

export default Display;
```

The `i18nkey` key in the above example is optional. If it is not present then
the translation string will fallback to the value of `defaults` key.

## Localization best practices

Many of the applications start their development by optimizing for users who speak English. So the project will have a single translation file, say `en.json`, where all the translations will be dumped.

Without any conventions on how to design these translation files, the project would unintentionally start to overfit the sentence structure of that language. Since different languages have different sentence structures, it would take a complete overhaul to extend the application to another language.

Here are some best practices to follow when you are localizing your app:

- Do not break sentences into multiple translation keys. Always prefer interpolation or the `Trans` component. Here is an example:

  ```jsx
  <p>
    <a href="/cart">Click here</a> to view items in your cart
  </p>
  ```

  The above code **should not** be localized as this:

  ```jsx
  <p>
    <a href="/cart">{t("click.here")}</a>
    {t("to.view.items.in.cart")}
  </p>
  ```

  When you are migrating to another language, say, for example, Hindi, it should be rendered like this:

  ```jsx
  <p>
    अपने कार्ट में आइटम देखने के लिए <a href="/cart">यहां क्लिक करें</a>
  </p>
  ```

  As you can see, the positioning of the anchor tag has moved when the language changed. We cannot achieve this using previous structuring of our translations. The correct way of translating this would be:

  ```jsx
  // JSX file
  <Trans i18nKey="view.items.in.cart" components={{ a: <a href="/cart" /> }} />

  // en.json key:
  {
    // ...other ancestor keys
    in: {
      cart: "<a>Click here</a> to view items in your cart"
    }
  }

  // hi.json will be:
  {
    // ...other ancestor keys
    in: {
      cart: "अपने कार्ट में आइटम देखने के लिए <a>यहां क्लिक करें</a>"
    }
  }
  ```

- When there are multiple similar sentences, we might be tempted to use interpolation with other translations as values. Here is an example:

  ```jsx
  // JSX
  <Button
    label={t("common.add", {
      what: t("settings.general.automationRule").toLowerCase(),
    })}
  />;

  // en.json
  {
    common: { add: "Add {{what}}" },
    settings: { general: { automationRule: "Automation rule" }}
  }
  ```

  It significantly downgrades the code readability. Moreover, we have the headache of converting the strings to uppercase and lowercase as per their placement.

  Even though it might introduce repetitive sentences in the `en.json` file, it is good to keep the translation values as complete sentences whenever possible. Avoid passing translation values for interpolation inside another translation value.

  Using full sentences for translations will also help us to hire some freelancers to translate our resources. Plain sentences are easier to translate than complex string interpolations for people from a non-technical background.

  So the ideal code would be:

  ```jsx
  // JSX
  <Button label={t("settings.general.addAutomationRule")} />
  ```

- Keep the translation keys short yet meaningful and avoid too much nesting. Otherwise, it will force the code to be long. Keep in mind that the priority goes to the key being meaningful than being short. The key name should convey what it holds, even if it gets long.
- Use the context of the sentence for nesting translation keys instead of its placement. But translation keys can be grouped, if required, based on where it is rendered. For example: `widget.email.fields.subject.placeholder` can be replaced with `widget.email.enterRecipientEmail`. That former key doesn't hint at what kind of sentence it holds. It will make reading the code difficult.
- Don't assume that the data will always be singular or plural. Also, avoid lazy sentences like `Are you sure to delete 50 item(s)?`. i18next can automatically choose singular or plural sentences based on data counts. Read more at: https://www.i18next.com/translation-function/plurals
- `i18next` also has great support for the following localization requirements. Use them instead of manually formatting these cases:
  - [Comma-separating numbers based on the current locale](https://www.i18next.com/translation-function/formatting#number)
  - [Formatting currency with currency code](https://www.i18next.com/translation-function/formatting#currency)
  - [Formatting date and time](https://www.i18next.com/translation-function/formatting#datetime)
  - [Rendering a list to string with joiners like `and`](https://www.i18next.com/translation-function/formatting#list)
- Keep enough space between different components in the UI. The text labels might get longer or shorter when the language is changed.
- Keep in mind that some languages like Arabic are written from right to left (RTL). The app should be designed in such a way that the UI would not break when the text direction is inverted.
