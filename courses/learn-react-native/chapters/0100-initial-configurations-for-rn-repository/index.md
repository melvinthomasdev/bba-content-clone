## .prettierrc.js config

```
module.exports = {
    bracketSpacing: true,
    singleQuote: true,
    trailingComma: 'es5',
    tabWidth: 2,
    printWidth: 150,
};
```

## .eslintrc.js config

```
module.exports = {
    env: {
        browser: true,
        es6: true,
        node: true,
        'react-native/react-native': true,
        'jest/globals': true,
    },
    extends: ['eslint:recommended', 'plugin:react/recommended', 'plugin:prettier/recommended', 'plugin:promise/recommended'],
    settings: {
        react: {
            version: 'detect',
        },
        'import/resolver': {
            'babel-module': {
                root: ['.'],
                alias: require('./aliases.json'),
            },
        },
        'react-native/style-sheet-object-names': ['EStyleSheet'],
    },
    parserOptions: {
        ecmaFeatures: {
            jsx: true,
        },
        ecmaVersion: 8,
        sourceType: 'module',
    },
    parser: 'babel-eslint',
    plugins: ['react', 'react-native', 'jest', 'import'],
    rules: {
        eqeqeq: ['error', 'always'],
        'import/no-unresolved': 2,
        'no-console': 2,
        'promise/prefer-await-to-then': 2,
        'promise/no-nesting': 2,
        'promise/prefer-await-to-callbacks': 2,
        'react/jsx-curly-brace-presence': ['error', {props: 'never', children: 'ignore'}],
        'react/prop-types': ['error', {ignore: ['navigation', 'theme']}],
        'react-native/no-unused-styles': 2,
        'react-native/split-platform-components': 1,
        'react-native/no-inline-styles': 1,
        'react-native/no-raw-text': 1,
        'react-native/no-single-element-style-arrays': 1,
        'require-await': 2,
    },
};
```

## Implement eslint and prettier using pre-commit hook

- Run command
  `yarn add eslint-plugin-react eslint-plugin-react-native eslint-plugin-import eslint-import-resolver-babel-module husky lint-staged prettier eslint-plugin-prettier eslint-config-prettier eslint-plugin-jest eslint-plugin-promise babel-plugin-module-resolver --dev`
- Run command `yarn husky install`
- Add the following config in package.json

```
"lint-staged": {
    "*.{js,jsx}": [
        "prettier --write",
        "eslint --fix",
        "eslint",
        "jest --bail --findRelatedTests"
    ]
}
```

- Run command `npx husky add .husky/pre-commit "yarn lint-staged"`

## Path alias

- We already installed `eslint-plugin-import`,
  `eslint-import-resolver-babel-module` and `babel-plugin-module-resolver`
  packages.
- The eslint config for path alias is already present in the above .eslinrc.js
  config.
- So, just add following config in babel.config.js

```
plugins: [
    [
        'module-resolver',
        {
            root: ['.'],
            alias: require('./aliases.json'),
        },
    ],
],
```

- And create a aliases.json file in root directory which will contain all the
  path mappings in the following manner, where @components is the alias for the
  relative url "./app/components".

```
{
    "@components": "./app/components",
}
```

- For intellisense to work in vscode, we need to add a jsconfig.json in the root
  directory as well, which contains the mapping in the following manner:

```
{
    "compilerOptions": {
        "baseUrl": ".",
        "paths": {
            "@components/*": ["./app/components/*"],
        }
    }
}
```

## Base packages to start with

- Install following packages for implementing navigation.
  `yarn add @react-navigation/native react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view @react-navigation/stack`

- Install following package for implementing scalable size units.
  `yarn add react-native-extended-stylesheet`

- Install following package for showing various messages across the app.
  `yarn add react-native-snackbar`

- Install following package for implementing state management library redux.
  `yarn add redux react-redux`

- Install following package for persisting redux state and use aysncStorage as
  your default storage.
  `yarn add redux-persist @react-native-async-storage/async-storage`

- Install following package for easing the process of making api request.
  `yarn add axios`

- Install following package for implementing splash screen.
  `yarn add react-native-bootsplash`

- Install following package for specifying prop-types of components.
  `yarn add prop-types`

- Install following package for adding prop based dynamic styling.
  `yarn add styled-components`

- Install all the above packages in single command.
  `yarn add @react-navigation/native react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view @react-navigation/stack react-native-extended-stylesheet react-native-snackbar redux react-redux redux-persist @react-native-async-storage/async-storage axios react-native-bootsplash prop-types styled-components`

- Add the following config in package.json file

```
"resolutions": {
    "styled-components": "^5"
}
```

- Run command `npx pod-install ios`

## Setup for tests

- Run command
  `yarn add @types/jest enzyme enzyme-adapter-react-16 jest-enzyme jest-transform-stub react-dom --dev`
- Create a dir named `jest` in the root of the project and a file inside jest
  dir with the name `setup.js` and add the following config in `setup.js`.

```javascript
import Enzyme from "enzyme";
import Adapter from "enzyme-adapter-react-16";

Enzyme.configure({ adapter: new Adapter() });
```

- Add the following keys under jest object in package.json

```
"jest":{
    ...
    "moduleNameMapper": {
        ".+\\.(css|styl|less|sass|scss|png|jpg|ttf|woff|woff2)$": "jest-transform-stub"
    },
    "setupFiles": [
        "<rootDir>/jest/setup.js"
    ],
    "setupFilesAfterEnv": [
        "./node_modules/jest-enzyme/lib/index.js"
    ],
    "testEnvironment": "jsdom"
}
```

## Final changes before starting the actual work.

- Add `import 'react-native-gesture-handler';` at the top of `index.js` file in
  the root of your project.
- Create a dir named `src` in the root of your project.
- Add the following key in `aliases.json` we created previously.

```
"@src": "./src"
```

- Add the following key under paths in `jsconfig.json` we created previously.

```
"@src/*": ["./src/*"]
```

- Within the `src` dir add a file `navigation.js`. This will be the file where
  we add all navigation details. Following is a boilerplate. Checkout React
  Navigation [docs](https://reactnavigation.org/docs/getting-started) to
  understand the boilerplate.

```javascript
// LIBRARIES
import React from "react";
import {
  createStackNavigator,
  CardStyleInterpolators
} from "@react-navigation/stack";

// SCREENS IMPORT
import ExampleScreen from "@screens/ExampleScreen";

const Stack = createStackNavigator();
function ExampleApp() {
  return (
    <Stack.Navigator
      headerMode="none"
      screenOptions={{
        gestureEnabled: true,
        gestureDirection: "horizontal",
        cardStyleInterpolator: CardStyleInterpolators.forHorizontalIOS
      }}
    >
      <Stack.Screen name="ExampleScreen" component={ExampleScreen} />
    </Stack.Navigator>
  );
}

export default ExampleApp;
```

- <ins>Note</ins>: In the above snippet we see `ExampleScreen`. You can create
  any screen but make sure to implement it and add correctly the alias in
  `aliases.json` as well as `jsconfig.json` in order to run the app.
- Replace the content of `App.js` in the root of your project with the
  following.

```javascript
// LIBRARIES
import React from 'react';
import {Platform} from 'react-native';
import {NavigationContainer} from '@react-navigation/native';
import {SafeAreaProvider} from 'react-native-safe-area-context';
import EStyleSheet from 'react-native-extended-stylesheet';

// APP SETUP
import ExampleApp from '@src/navigation';

EStyleSheet.build({$rem: Platform.OS === 'ios' ? 1.1 : 0.95});

export default class App extends React.Component
    render() {
        return (
            <NavigationContainer>
              <SafeAreaProvider>
                  <ExampleApp />
              <SafeAreaProvider/>
            </NavigationContainer>
        );
    }
}
```

### Adding support for tests

- Create a dir named `__mocks__` in your project's root dir.
- Create a file named `mock.js` within the `__mocks__` dir.
- Add the following code in `mock.js`.

```javascript
import "react-native-gesture-handler/jestSetup";

jest.mock("react-native-reanimated", () => {
  const Reanimated = require("react-native-reanimated/mock");
  Reanimated.default.call = () => {};
  return Reanimated;
});

jest.mock("react-native/Libraries/Animated/src/NativeAnimatedHelper");
```

- In `package.json` add the following line within `setupFiles` array under
  `jest` key.

```
"<rootDir>/__mocks__/mock.js"
```

- Once you are done with all the above configuration you can now run the app
  with either `yarn ios` or `npx react-native run-ios` for iOS build or
  `yarn android` or 'npx react-native run-android` for android build.

## Setup for Redux

- Create a dir named `redux` inside `src` dir we created above.
- Under `redux` create two files `reducers.js` and `store.js`.
- Add the below code in `reducers.js`.

```javascript
import { combineReducers } from "redux";
const Reducer = combineReducers({});
export const rootReducer = Reducer;
```

- Add the below code in `store.js`.

```javascript
import { createStore } from "redux";
import { rootReducer } from "./reducers";
export default Store = createStore(rootReducer);
```

- Now as and when we create new reducers we have to import it add it to
  combineReducers in `reducers.js` file.
- Add following key in `aliases.json` we created previously.

```
"@redux": "./src/redux"
```

- Add following key in `jsconfig.json` we created previously.

```
"@redux/*": ["./src/redux/*"],
```

- Add following import statements in `App.js` of your root dir.

```javascript
import { Provider } from "react-redux";
import Store from "@redux/store";
```

- Add `Provider` and `Store` in `App.js` of your root dir as below.

```javascript
...
<Provider store={Store}>
    <NavigationContainer>
        <SafeAreaProvider>
            <ExampleApp />
        </SafeAreaProvider>
    </NavigationContainer>
</Provider>
...
```

### Redux persist

- For adding redux persist please follow the installation guide of the package
  [here](https://www.npmjs.com/package/redux-persist).
- After adding redux persist your `store.js` under `redux` dir may look
  something like this.

```javascript
import { createStore } from "redux";
import { persistStore, persistReducer } from "redux-persist";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { rootReducer } from "./reducers";
const persistConfig = {
  key: "root",
  storage: AsyncStorage
};
const persistedReducer = persistReducer(persistConfig, rootReducer);
export const Store = createStore(persistedReducer);
export const Persistor = persistStore(Store);
```

- And you `App.js` in your root dir may look like this.

```javascript
// LIBRARIES
import React, { useEffect } from "react";
import { Platform } from "react-native";
import { NavigationContainer } from "@react-navigation/native";
import { SafeAreaProvider } from "react-native-safe-area-context";
import EStyleSheet from "react-native-extended-stylesheet";
import Snackbar from "react-native-snackbar";

// REDUX SETUP
import { Provider } from "react-redux";
import { Store, Persistor } from "@redux/store";
import { PersistGate } from "redux-persist/integration/react";

// APP SETUP
import ExampleApp from "@src/navigation";

EStyleSheet.build({ $rem: Platform.OS === "ios" ? 1.1 : 0.95 });

const App = () => {
  // Example of usage of snackbar
  useEffect(() => {
    Snackbar.show({
      text: "Shows the snackbar when the component has loaded",
      duration: Snackbar.LENGTH_SHORT
    });
  }, []);

  return (
    <Provider store={Store}>
      <PersistGate loading={null} persistor={Persistor}>
        <NavigationContainer>
          <SafeAreaProvider>
            <ExampleApp />
          </SafeAreaProvider>
        </NavigationContainer>
      </PersistGate>
    </Provider>
  );
};

export default App;
```
