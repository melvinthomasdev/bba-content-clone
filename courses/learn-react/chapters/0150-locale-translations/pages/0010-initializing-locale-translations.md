So far, we have been using English as the default language throughout our application. But different users speak different languages. To ensure that our application is accessible to a global audience, it is crucial to provide content in multiple languages. By implementing localization, we can display our application's text and content in various languages, allowing users to interact with our app in their preferred language.

For example, if the default language of an application is English, then with proper localization support the application can also be accessed in another language, say French. In this lesson, we will explore how to implement localization in our application, enabling developers to reach a wider audience.

We can use the [i18next](https://www.i18next.com) and [react-i18next](https://yarnpkg.com/package?name=react-i18next) libraries to add localization support to our React application. i18next is a popular internationalization framework that provides a comprehensive solution for managing translations and language switching. On the other hand, react-i18next is a wrapper around i18next, specifically designed for React applications. It simplifies the integration of i18next with React by providing custom React components and hooks that facilitate the use of translations within React components.

### Setting up localization

Let's see how we can add localization support to our app:

**Step 1:** Install the required packages using the following command:

```bash
yarn add react-i18next@12.3.1 i18next@21.7.0
```

**Step 2:** Now setup a configuration file for `i18next`. Create a file called `i18n.js` inside the `src/common` directory using the following command:

```bash
mkdir -p src/common
touch src/common/i18n.js
```

Also, we need to create a JSON file that will contain the translation strings under the `src/translations` directory. This file contains a set of key-value pairs, where the keys represent the identifiers for specific translations, and the values contain the corresponding translated text. We will maintain a separate JSON file for each language. In our case, we will create a JSON file for the English.

```bash
mkdir -p src/translations
touch src/translations/en.json
```

We will add a sample translation key to `en.json` file, to make sure it won't fail at the time of importing.

```json
{
  "helloWorld": "Hello World"
}
```

Inside the `i18n.js` file, we will initialize the `i18n`. To load and bind any plugins to the `i18n` instance, we can use the `use` method available in the `i18n` object. In this case, we are binding the `initReactI18next` function provided by `react-i18next` to the `i18n` instance. This ensures that various components of the `react-i18next` will have access to the `i18n` instance which is required for translation.

```js
import i18n from "i18next";
import { initReactI18next } from "react-i18next";

i18n.use(initReactI18next);

export default i18n;
```

We will use the `init` function to initialize the `i18n` instance with configuration options. The `init` function accepts an object which contains the configuration in key-value pairs.

We will set the `resources` and the `fallbackLng` options. The `resources` option is used to specify the available translations for different languages. It takes an object where each key represents a language code, and the corresponding value is an object that contains translations for that language. The `fallbackLng` option ensures fallback to a language in case the translation is missing for a specific language. We will be setting it to `en`.

```js {3, 6-7}
// ...
import en from "translations/en.json";

i18n.use(initReactI18next).init({
  resources: { en: { translation: en } },
  fallbackLng: "en",
});

export default i18n;
```

> Note: en is the ISO code for the English language

Now, go to the `src/index.jsx` file, and import `i18n` before the `App` import to ensure that `i18n` is initialized before rendering the React components. We will disable the `import/order` [ESLint](https://eslint.org) rule to prevent automatic fixing of import orders while committing:

```jsx {2}
// ...
import "./common/i18n";
//i18n should load before App initialization. Hence, disabling import/order rule.
// eslint-disable-next-line import/order
import App from "./App";
import "./index.css";

//rest of the code
```

Its a good practice to add the reason when you disable an ESLint rule, and it is advised not to disable ESLint rule without adding a comment.

In the next lesson, we will see how we can use the `i18n` and `react-i18n` libraries to localize hard-coded strings in our application.

Let's commit the new changes:

```bash
git add -A
git commit -m "Initialized i18n"
```

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/29327e1ab8b377cc45096aa8589c436ec593a5c1).
