Localization refers to the process of adaptation of an application to meet the
linguistic requirements of a specific region. In simple terms, if the default
language of an application isEnglish, then with proper localization support the
application can also be accessed in another language, say French.

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
like so:

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

Now add the required translation string inside the `en.json` file like so:

```json
{
  "example_text": "This is a translated text."
}
```

## Interpolation in translation strings

In the previous section we saw how to translate a simple string. In this section
we will take a look at how to translate strings with a dynamic part. Suppose the
string to be translated contains a name or a number and the name is dynamic. In
such a case, the string can be translated like so:

```jsx
import React from "react";

import { useTranslation } from "react-i18next";

const Display = ({ userName }) => {
  const { t } = useTranslation();

  return <p>{t("user_name", { name: userName })}</p>;
};

export default Display;
```

Now add the required translation inside the `en.json` file like so:

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
component from the `react-i18next` library like so:

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

Add the required translation inside the `en.json` file like so:

```json
{
  "important": "This is the <1>important part </1>"
}
```

There is an alternate syntax of the `Trans` component which we can use to save
us the trouble of guessing the index numbers. Instead of the numbered tags
inside the translation string we can use simpler named tags like so:

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
