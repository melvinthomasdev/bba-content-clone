We assume that you have already set up your PC with Node.js and npm. If you haven't installed them yet, please visit the official [Node.js](https://nodejs.org/en/download) website and download Node.js by selecting your operating system. It's worth noting that Node version 18.17.0 includes npm by default, so if you are installing Node version 18.17.0 or higher, you don't need to install npm separately.

Once you have `npm` installed, open your terminal and run the following command to install `yarn`. We will be using `yarn` as our package manager.

```
npm install --global yarn
```

Now, let's create a React app. In your terminal, navigate to the desired folder where you want to create the React app. Then, run the following command. In this example, we'll use `my-app` as the project name, but feel free to choose any name for your project.

```
yarn create react-app my-app
```

The above command will create a new directory named `my-app` inside the current folder. It will generate the initial project structure in `my-app` and install the dependencies.

Now, let's navigate to the `my-app` folder. To do that, run the following command in your terminal.

```
cd my-app
```

Now, let's run our React app. Run the below command and then open http://localhost:3000 in the browser.

```
yarn start
```

You should be able to see the React app running, as shown below:

<image>running-react-app.gif</image>

Setting up a basic react app is that simple.

Let's take a look at a few aspects of the generated React app. Open the `my-app` folder in your code editor, you will see a folder structure as shown in the image below:

<image>my-app-folder-structure-1.png</image>

Next, navigate to the `App.js` file inside the `src` folder.

At Bigbinary, we follow the best practice of naming files containing JSX with the `.jsx` extension.  Additionally, we use the ES6 arrow function to define a component, and we prefer implicit returns, which differ from the generated code snippet.

To align with these conventions, let's rename the file `App.js` to `App.jsx`, and then update the code in the `App.jsx` file with the following code.

```jsx {4-4, 19-19, 22-22}
import logo from './logo.svg';
import './App.css';

const App = () => (
  <div className="App">
    <header className="App-header">
      <img alt="logo" className="App-logo" src={logo} />
      <p>
        Edit <code>src/App.js</code> and save to reload.
      </p>
      <a
        className="App-link"
        href="https://reactjs.org"
        rel="noopener noreferrer"
        target="_blank"
      >
        Learn React
      </a>
      <p>My first React App.</p>
    </header>
  </div>
);

export default App;
```

After making the changes, save the file.

Now, if you head back to the React app running in your browser, you can see that the page updates automatically without manually refreshing it. React's Hot reloading feature makes this behavior possible.
