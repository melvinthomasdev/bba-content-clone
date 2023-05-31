## Stack and Tab Navigators

**What is a Stack Navigator?**

A Stack Navigator provides a way for your app to transition between screens where
each new screen is placed on top of a stack.

**What is a Tab Navigator?**

A Tab Navigator is a simple tab bar at the bottom of the screen that lets you
switch between different routes. Routes are lazily initialized -- their screen
components are not mounted until they are first focused.

In this article we will learn to use nested navigators in react native
by placing a stack navigator inside a tab navigator.

**Setting Up**

`yarn add @react-navigation/native @react-navigation/bottom-tabs @react-navigation/stack`

We want to create a navigation structure as follows:

![nested-navigators-RN](https://user-images.githubusercontent.com/61535301/122767052-dccde680-d2bf-11eb-896b-22a3e6b89884.png)

Create a file, src/navigation/Navigation.js, 
where we will manage navigation for the app.

![src-structure](https://user-images.githubusercontent.com/61535301/122945074-ef1a5400-d395-11eb-80fb-4574bb894542.png)

**Building Stacks**

Say I want to add tab icons for Home and Details in the Tab Navigator.
From the Details tab I should be able to navigate to an inner screen named
InnerDetails.js.
So we will need to create separate stacks using the Stack Navigator for the two
tabs that we want.

We want only one screen for the Home tab, 
which is the loaded by default when the app starts.
The HomeStack would define that screen as follows:

```javascript
import { createStackNavigator } from "@react-navigation/stack";
import Home from "@screens/Home";

const HomeStack = createStackNavigator();
const screenNames = {
  home: "Home",
};

function HomeStackScreen() {
  return (
    <HomeStack.Navigator
      headerMode="none"
      screenOptions={{
        gestureEnabled: true,
        gestureDirection: "horizontal",
      }}
      initialRouteName={screenNames.home}
    >
      <HomeStack.Screen name={screenNames.home} component={Home} />
    </HomeStack.Navigator>
  );
}
```

Next we want a Details tab button
for navigating to the Details screen.
Inside that screen we want a button that
will display an inner screen named InnerDetails.js.

We will hide our Tab bar in this particular screen
with `getFocusedRouteNameFromRoute` from `@react-navigation/stack`.
With that in mind, the Details Stack would be as follows:

```javascript
import React, { useEffect } from "react";
import { createStackNavigator } from "@react-navigation/stack";
import { getFocusedRouteNameFromRoute } from "@react-navigation/native";
import Details from "@screens/Details";
import InnerDetails from "@screens/InnerDetails";

const screenNames = {
  details: "Details",
  innerDetails: "InnerDetails",
};
const DetailsStack = createStackNavigator();

function DetailsStackScreen({ navigation, route }) {
  const tabHiddenRoutes = ["InnerDetails"];
  useEffect(() => {
    if (tabHiddenRoutes.includes(getFocusedRouteNameFromRoute(route))) {
      navigation.setOptions({ tabBarVisible: false });
    } else {
      navigation.setOptions({ tabBarVisible: true });
    }
  }, [navigation, route]);
  return (
    <DetailsStack.Navigator
      headerMode="none"
      screenOptions={{
        gestureEnabled: true,
        gestureDirection: "horizontal",
      }}
      initialRouteName={screenNames.details}
    >
      <DetailsStack.Screen name={screenNames.details} component={Details} />
      <DetailsStack.Screen
        name={screenNames.innerDetails}
        component={InnerDetails}
      />
    </DetailsStack.Navigator>
  );
}
```

**Configuring the Tab Bar**

Now we will add the two tabs to the Tab bar.
We want the Home screen to be our landing page
so we should specify the HomeStack as the initial route in the Tab Navigator.

It is also possible to add styles to the Tab bar
for different orientations using the `tabBarOptions` property of the Tab Navigator.
This can be useful for highlighting the active tab, for example, 
as we will demonstrate shortly.

To know more about the props to customize the Tab navigator have a look at
https://reactnavigation.org/docs/bottom-tab-navigator/ .

The Tab bar with the Home and Details tabs would be as follows:

```javascript
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";

const screenNames = {
  homeStack: "HomeStackScreen",
  detailsStack: "DetailsStackScreen",
};
const Tab = createBottomTabNavigator();

function Navigation() {
  return (
    <Tab.Navigator
      initialRouteName={screenNames.homeStack}
      tabBarOptions={{
        activeTintColor: "#688E26",
        inactiveTintColor: "#6C6C6C",
      }}
    >
      <Tab.Screen
        name={screenNames.homeStack}
        component={HomeStackScreen}
        options={{
          tabBarLabel: "",
          tabBarIcon: ({ color, focused }) => (
            <Icon
              name={focused ? "ri-home-fill" : "ri-home-line"}
              size="24"
              color={color}
            />
          ),
        }}
      />
      <Tab.Screen
        name={screenNames.detailsStack}
        component={DetailsStackScreen}
        options={{
          abBarLabel: "",
          tabBarIcon: ({ color, focused }) => (
            <Icon
              name={focused ? "ri-information-fill" : "ri-information-line"}
              size="24"
              color={color}
            />
          ),
        }}
      />
    </Tab.Navigator>
  );
}
```

**Putting it all together**

And here is the final Navigation.js code in the Navigation file (src/navigation/Navigation.js):

```javascript
import React, { useEffect } from "react";
import { createStackNavigator } from "@react-navigation/stack";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import Icon from "react-native-remix-icon";
import Home from "@screens/Home";
import Details from "@screens/Details";
import InnerDetails from "@screens/InnerDetails";
import { getFocusedRouteNameFromRoute } from "@react-navigation/native";

export const screenNames = {
  home: "Home",
  details: "Details",
  innerDetails: "InnerDetails",
  homeStack: "HomeStackScreen",
  detailsStack: "DetailsStackScreen",
};

const HomeStack = createStackNavigator();

function HomeStackScreen() {
  return (
    <HomeStack.Navigator
      headerMode="none"
      screenOptions={{
        gestureEnabled: true,
        gestureDirection: "horizontal",
      }}
      initialRouteName={screenNames.home}
    >
      <HomeStack.Screen name={screenNames.home} component={Home} />
    </HomeStack.Navigator>
  );
}

const DetailsStack = createStackNavigator();

function DetailsStackScreen({ navigation, route }) {
  const tabHiddenRoutes = ["InnerDetails"];
  useEffect(() => {
    if (tabHiddenRoutes.includes(getFocusedRouteNameFromRoute(route))) {
      navigation.setOptions({ tabBarVisible: false });
    } else {
      navigation.setOptions({ tabBarVisible: true });
    }
  }, [navigation, route]);

  return (
    <DetailsStack.Navigator
      headerMode="none"
      screenOptions={{
        gestureEnabled: true,
        gestureDirection: "horizontal",
      }}
      initialRouteName={screenNames.details}
    >
      <DetailsStack.Screen name={screenNames.details} component={Details} />
      <DetailsStack.Screen
        name={screenNames.innerDetails}
        component={InnerDetails}
      />
    </DetailsStack.Navigator>
  );
}

const Tab = createBottomTabNavigator();

export default function Navigation() {
  return (
    <Tab.Navigator
      initialRouteName={screenNames.homeStack}
      tabBarOptions={{
        activeTintColor: "#688E26",
        inactiveTintColor: "#6C6C6C",
      }}
    >
      <Tab.Screen
        name={screenNames.homeStack}
        component={HomeStackScreen}
        options={{
          tabBarLabel: "",
          tabBarIcon: ({ color, focused }) => (
            <Icon
              name={focused ? "ri-home-fill" : "ri-home-line"}
              size="24"
              color={color}
            />
          ),
        }}
      />
      <Tab.Screen
        name={screenNames.detailsStack}
        component={DetailsStackScreen}
        options={{
          abBarLabel: "",
          tabBarIcon: ({ color, focused }) => (
            <Icon
              name={focused ? "ri-information-fill" : "ri-information-line"}
              size="24"
              color={color}
            />
          ),
        }}
      />
    </Tab.Navigator>
  );
}
```

**The following image shows the output:**
![home-details](https://user-images.githubusercontent.com/61535301/122937673-c98a4c00-d38f-11eb-8841-3efef20381dd.jpg)
