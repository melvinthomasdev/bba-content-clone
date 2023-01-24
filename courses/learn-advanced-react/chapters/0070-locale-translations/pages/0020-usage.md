## Translation of simple strings

To use the translation strings inside React components, we can either use the `withTranslation` higher order component or the `useTranslation` hook from `react-i18next`.

The `withTranslation`, higher order component can be used like so:

```jsx
import React from "react";
import { withTranslation } from "react-i18next";

const WelcomeText = ({ t }) => <p>{t("welcome_text")}</p>;

export default withTranslation()(WelcomeText);
```

In the example above, the `WelcomeText` component is called inside the `withTranslation` higher-order component making the `t` method available as a prop inside.

You can also use the `useTranslation` hook like so:

```jsx
import React from "react";
import { useTranslation } from "react-i18next";

const WelcomeText = () => {
  const { t } = useTranslation();

  return <p> {t("welcome_text")} </p>;
};

export default WelcomeText;
```

Regardless of the method used, you can now add the required translation string inside the `en.json` file like so:

```json
{
  "welcome_text": "Welcome to NeetoCourse."
}
```

The `t("welcome_text")` snippet will now be replaced by `"Welcome to NeetoCourse."` in the body of the `WelcomeText` component.

## Interpolation in translation strings

Suppose the string to be translated contains a name or a number and the name is dynamic. In such a case, the string can be translated with a dynamic part like so:

```jsx
import React from "react";
import { useTranslation } from "react-i18next";

const WelcomeText = ({ user: {firstName} }) => {
  const { t } = useTranslation();

  return <p> {t("welcome_text", {name: firstName})} </p>;
};

export default WelcomeText;
```

The required translation inside the `en.json` file should look like this:

```json
{
  "welcome_text": "Welcome to NeetoCourse, {{name}}"
}
```

## Using Singular/Plural Forms

You can differentiate between the singular and plural form of a word via interpolation using the variable name `count` like so:

```jsx
import React from "react";
import { useTranslation } from "react-i18next";

const IntroText = ({ user: {firstName, eventsCount} }) => {
  const { t } = useTranslation();

  return <p> {t("welcome_text", {name: firstName, count: userCount})} </p>;
};

export default IntroText;
```

When creating the translation inside the `en.json` file, use the suffix `_one` or `_other` to signify the corresponding translations

```json
{
  "welcome_text_one": "Welcome, {{name}}. You have {{count}} event scheduled.",
  "welcome_text_other": "Welcome, {{name}}. You have {{count}} events scheduled."
}
```

Using the above translations, i18next can apply the appropriate translations as demonstrated below:

```jsx
t("welcome_text", {name: "Oliver", count: 0}) //"Welcome, Oliver. You have 0 events scheduled."
t("welcome_text", {name: "Oliver", count: 1}) //"Welcome, Oliver. You have 1 event scheduled."
t("welcome_text", {name: "Oliver", count: 2}) //"Welcome, Oliver. You have 2 events scheduled."
```

i18 also facilitates many other types of pluralization including
  - Ordinal plurals : 1st, 2nd, 3rd, 4th, etc.
  - Interval plurals : (1) one event, (2-10) a few events, (11-inf) many events

You can dive deeper into this subject at: https://www.i18next.com/translation-function/plurals