## Installing react-navigation 5

yarn add @react-navigation/native

## Latest version of react navigation use many third part libraries, we can install them using yarn or npm

yarn add react-native-reanimated react-native-gesture-handler
react-native-screens react-native-safe-area-context
react-native-community/masked-view

## Example using navigation 5

```javascript
// Root.js component
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";

import AppStack from "./AppStack";
import AuthStack from "./AuthStack";
import navigationService from "./NavigationService";

const Stack = createStackNavigator();

const RootStack = () => {
  return (
    <NavigationContainer ref={navigationService.navigationRef}>
      <Stack.Navigator initialRouteName="Auth" headerMode="none">
        <Stack.Screen name="Auth" component={AuthStack} />
        <Stack.Screen name="App" component={AppStack} />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

// Auth Stack component
import SignInRequest from "../screens/SignIn";
import SignInSuccess from "../screens/SignInSuccess";

const Stack = createStackNavigator();

const AuthStack = () => {
  return (
    <Stack.Navigator initialRouteName="Request" screenOptions={screenOptions}>
      <Stack.Screen
        name="Request"
        component={SignInRequest}
        options={{
          title: "SignInRequest",
        }}
      />
      <Stack.Screen
        name="Success"
        component={SignInSuccess}
        options={{ title: "SignInSuccess" }}
      />
    </Stack.Navigator>
  );
};

// App Stack component
import Home from "../screens/home";
import Profile from "../screens/profile";

const Stack = createStackNavigator();

const AuthStack = () => {
  return (
    <Stack.Navigator initialRouteName="Home">
      <Stack.Screen
        name="Home"
        component={Home}
        options={{
          title: "Home",
        }}
      />
      <Stack.Screen
        name="Profile"
        component={Profile}
        options={{ title: "Profile" }}
      />
    </Stack.Navigator>
  );
};

// NavigationService.js

import * as React from "react";

export const navigationRef = React.createRef();

export const navigate = (routeName, params) => {
  navigationRef.current?.navigate(routeName, params);
};

export const changeStack = stackName => {
  resetRoot(stackName);
};

const resetRoot = routeName => {
  navigationRef.current?.resetRoot({
    index: 0,
    routes: [{ name: routeName }],
  });
};

// Whenever you want to change stack you can call change stack like this:-
navigationService.changeStack("App");
// you can change between the screen of same stack like this:-
navigation.navigate("Profile");
```

## For using nested navigator like drawer navigator, tab navigator and stack navigator, you can follow this link:-

https://reactnavigation.org/docs/nesting-navigators/
