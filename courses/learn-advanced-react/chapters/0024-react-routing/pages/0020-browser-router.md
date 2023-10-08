To use `react-router-dom`, you first need to add the `Browser Router` component which uses the HTML5 history API to keep the UI in sync with the URL.

To use the browser router, just import it from the `react-router-dom` and use place exactly one at the entry point of the application like this:

```jsx
import { BrowserRouter } from "react-router-dom";
import { Header } from "./Header"
import { Contacts } from "./Contacts"

const App = () => (
  <BrowserRouter>
    <Route path="/header" component={Header} />
    <Route path="/contact" component={Contact} />
  </BrowserRouter>
);

export default App
```

And if you want to create a link to a route within your application, use the `Link` component as shown below:

```jsx
import { Link } from "react-router-dom";

const Header = () => (
  <div className="linkToContact">
    Click here to jump to <Link to="/home">the contact page</Link>
  </div>
);
```

While similar to the `<a>` tag used to create hyperlinks, the `Link` component does not reload the entire page during navigation and preserves the application state, thus allowing you to reap the benefit of a Single Page Application.

It only works if there exists a route defined by the browser router within the app and is the recommended way of doing in-app navigation.

Use the `<a>` tag only if you need to navigate to an external page.

If you'd like to dive deeper into the usage of the React Router Dom, check out [this page from our LRRB book.](/learn-rubyonrails/basics-of-react-router-dom)