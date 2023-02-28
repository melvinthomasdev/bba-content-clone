Single Page Applications (SPAs) are applications that rewrite sections of their page instead of reloading the entire page every time you click on a link. This makes improves load times, reduces data transfers and keeps your users happy. Some famous examples are Reddit and Twitter.

The [React Router package](https://github.com/remix-run/react-router) is a lightweight and very popular routing library that handles navigation within these SPAs.

It also changes the browser URL as we navigate and properly records the browser history. This is a common problem in SPAs as everything being contained on one page means that the browser can't tell when we're navigating.

## Installation

React Router has three commonly used packages : 
  - `react-router` - Core package 
  - `react-router-dom` - Contains DOM bindings allowing you to use the core with React web applications
  - `react-router-native` - Contains Native bindings allowing you to use the core with React Native applications

We won't be covering `react-router-native` in this guide.

To install `react-router-dom`, just use the command `yarn add react-router-dom`. 

Since `react-router-dom` gives you access to `react-router` by default, you don't need `react-router` as a dependency too.