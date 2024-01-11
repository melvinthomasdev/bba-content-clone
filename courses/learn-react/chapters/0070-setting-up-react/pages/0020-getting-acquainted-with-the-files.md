In this lesson, we will explore the files and folders within the project directory of the React app that we created in the previous lesson.

You should have the following files and folders inside your React project directory:

<image>my-app-files-structure.png</image>

Now, let's understand the significance of the folders and files present in the `my-app` directory.

1.`node_modules` folder: The `node_modules` folder stores all the external dependencies or packages required by the project. When you use a package manager like `yarn` to install packages for your project, these packages are downloaded and stored in the `node_modules` folder.

2.`public` folder: The `public` folder contains the static assets that are directly copied to the build directory during the build process. It includes the HTML file, images, and other static files.

3.`package.json` file: The `package.json` file is a JSON file that holds metadata and configuration information about the project, including its name, version, dependencies, and scripts. So when someone else wants to work on your project, they can run `yarn install` to download and install all the required dependencies listed in the `package.json` file.

4.`yarn.lock` file: The `yarn.lock` file is used to lock down the exact versions of the dependencies installed in the project. It ensures that the same versions of the packages are installed across different environments and prevents potential compatibility issues.

## src folder

The `src` folder in a React project typically stands for `source` and is used to store the source code files of your application. All the logic and components related to the React app will be in the `src` folder. We can logically organize components into different files and directories based on their functionalities. Then we can use import and export statements to include and use these components in other parts of the application where they are needed.

To export a component from a file, we use the export statement, as shown below:

```jsx
export default App;
```

Once a component is exported, we can import it into other files using the import statement, like this:

```jsx
import App from "./App";
```

This modularity enables us to reuse components and build a well-structured and maintainable application.

Now, let's take a look at the brief introduction of the files present inside the `src` folder:

- `index.js` file: This is the entry point of the React app. It renders the root component i.e. `App` and mounts it into the HTML document.

- `App.js` or `App.jsx` file: This is the main component of the app. It represents the root of the React component tree and contains the overall structure and layout of the app.

- `index.css` file: This is the main CSS file for the app. It contains styles that are applied globally across the entire app.

- `App.css` or `App.scss` file: This file contains CSS or SCSS styles specific to the App component.

- `App.test.js` file: You can write unit tests for the App component in this file.

- `reportWebVitals.js` file: This file is related to performance monitoring and reporting. It provides a way to report web vitals to different analytics tools or performance monitoring services.

- `setupTests.js` file: This file is used for setting up the testing environment. It allows you to configure testing libraries or setup any necessary configurations before running the test cases.
