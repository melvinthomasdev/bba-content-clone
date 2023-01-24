Localization is the process of making an application accessible in languages other than its default language.

We here at BigBinary highly recommend using the [i18next](https://www.i18next.com/) and [react-i18next](https://www.npmjs.com/package/react-i18next) libraries to add localization support to your React application. The `i18next` library provides the translation functionality while `react-i18next` is a framework for React based on `i18next`.

i18 next is an extremely robust and mature framework that should be able to handle just about any edge case you could need translation-wise.

To install the packages, just use the following command: `yarn add react-i18next i18next`

Create a JSON file inside the `src/translation` directory to hold the translation strings using the following commands:
`mkdir -p app/javascript/src/translation`
`touch app/javascript/src/translation/en.json`

Setup a configuration file by creating a file called `i18n.js` inside the `src/common` directory using the command:
`touch app/javascript/src/common/i18n.js` and add the following recommended initializer settings:

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

The section below explains how the contents of the configuration file were created. If you'd like to jump straight to the usage of i18next, head on to the next page.

## Configuration Details

Invoking the `use` function loads and binds any plugins to the `i18n` object from the `i18next` library. We are binding the `initReactI18next` object provided by `react-i18next` to the `i18n` object. This ensures that various components of the `react-i18next` will have access to the `i18n` object which is required for translation.

We are then initializing our configuration by calling the `init` function. The `init` function accepts an object which contains the configuration in key-value pairs.

`resources` key should contain an object of resources for various languages. For example, `en` is the ISO code for english language and it contains the translation strings for the english language. The translation strings as mentioned earlier are declared inside the `en.json` file and then imported for use inside the configuration file.

The `lng` option specifies the language to use while the `fallbackLng` option ensures fallback to a language in case the translation strings are not present.

Interpolation is one of the most used functionalities in localization as will be seen on the next page. It allows integrating dynamic values into your translation strings. By default, the interpolation values get escaped to mitigate XSS attacks. To prevent that we have declared `escapeValue: false` as an option.

Another reason to escape the interpolation values is to allow rendering special characters like `&` or `$`. If we don't escape the values then instead of the special characters an equivalent HTML entity will be rendered. For example, in place of `&`, `amp;` will be rendered in the translated string.

For more configuration options, please refer to the [official documentation](https://www.i18next.com/overview/configuration-options) of `i18next.`