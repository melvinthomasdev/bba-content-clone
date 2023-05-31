## What is React Native?

React Native is a cross-platform application development framework that enables
developing apps for Android, iOS and Web using JavaScript.

You will have a better answer to this question as we move forward. Even though
we can build web apps, in this book, we will focus on mobile app development.

## Prerequisite Knowledge

To follow this book efficiently you should have intermediate knowledge of
JavaScript language and Unix commands. Besides, any experience with ReactJs or
native Android/iOS development will be helpful, but it is not required.

## Configure your machine for development

Mainly there are two different ways to build a React Native project, using _Expo
CLI_ or _React Native CLI_ we will be using React Native CLI in this book.
Follow the _React Native CLI Quickstart_ section in the
[official development environment setup](https://reactnative.dev/docs/environment-setup)
guide to configure your local system.

## Create a React Native Project

In this book we will be building a social media app for book lovers using
Firebase as backend, let's call it **opus**. Create the opus app by running the
following command.

```zsh
npx react-native init opus
```

This command will create a React Native project inside a folder named `opus`.

## Hello, React Native!

Let's open the project folder in your code editor, we will be using Visual
Studio code, but you can use any code editor you like.

Inside the project folder, you will see lots of files as shown in the below
image.

![React Native project structure](https://user-images.githubusercontent.com/19279756/113819361-d0dd8880-9796-11eb-9382-ea95b599bb04.jpg)

For a while, we will only use the `App.js` file so don't bother about any other
files for now. Open the `App.js` file and replace its content with the following
snippet.

```javascript
import React from "react";
import { View, Text } from "react-native";

const App = () => {
  return (
    <View>
      <Text>Hello, React Native!</Text>
    </View>
  );
};

export default App;
```

Now run the app using the following command.

```zsh
yarn ios      # for ios
yarn android  # for android
```

You can use either of the above commands to run it in your default iOS or
Android emulator. The text will be little off the screen, but let's not worry
about style for while.

![Hello, React Native! app screenshots](https://user-images.githubusercontent.com/19279756/109434854-33779200-7a3d-11eb-830c-8e7f1f7d134c.jpg)

Now let's take a closer look at the code. React Native is based on ReactJS, so
we need to import it in all our components.

```javascript
import React from "react";
```

The main difference between React and React Native is that React Native use core
components like `View`, `Text` and `Image` instead of HTML elements like `div`,
`h1` and `img` for layout. We can import all core components from
`react-native`.

```javascript
import { View, Text } from "react-native";
```

Components are the basic building blocks in React Native. Here we have the
custom `App` component which uses the React Native `View` and `Text` to display
the text `Hello, React Native!` to the screen.

```javascript
const App = () => {
  return (
    <View>
      {" "}
      // Container component
      <Text>Hello, React Native!</Text> // Display text
    </View>
  );
};
// Export App component
export default App;
```

## Core components

React Native offers different core components which we can use to build our user
interface. In the above example we are using `View` and `Text` core components.

### View

`View` is the most fundamental component in React Native which we can use as a
container for other components. A `View` can have 0 to any number of components
in it and we can use styles to display it properly. We will look into styles in
upcoming chapters.

### Text

Unlike the web, you can't throw text into any component you want. To display
text in React Native it should be inside a `Text` component.

You can find all available React Native core components in the
[official doc](https://reactnative.dev/docs/components-and-apis).

## Assignment

Now that we have learned the basics of React Native let's build the following
screen for our opus app.

![BigBinary React Native Book - Introduction Assignment task design](https://user-images.githubusercontent.com/19279756/113818615-a9d28700-9795-11eb-91e7-8fcbad1ef6a1.jpg)

### Assignment resources

- Book cover image:
  https://user-images.githubusercontent.com/19279756/109667147-da6f4180-7b95-11eb-9d8f-cca772d8733a.jpg
