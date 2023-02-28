Just like the Browser Router, we also have a Hash Router that navigates using
hashed URLs like these:

```
https://examplesite.com/#/contact
```

The hashed part of the URL `#/contact` is not shown to the server side and
allows the client-side browser to navigate to the "Contact" page.

Previously, hashed URLs like the one shown above used to be the norm when
creating Single Page Applications (SPAs) but thanks to the tools like the
History API and the Browser Router shown earlier, they've slowly fallen out of
fashion.

In modern websites, it is mainly used to scroll down to a specific section of an
article like in Wikipedia where
`https://en.wikipedia.org/wiki/React_(JavaScript_library)#Notable_features`
scrolls us down to the "Notable Features" section.

A few points to keep in mind:

- The Hash Router helps when targeting older browsers that don't support the
  HTML5 history API.
- It is very easy to implement as the client-side routing never clashes with
  server-side routing
- It is bad at Search Engine Optimization

It can be implemented the same way as the browser router shown before but with
`HashRouter` as shown below:

```jsx
import { HashRouter } from "react-router-dom";
import { Header } from "./Header";
import { Contacts } from "./Contacts";

const App = () => (
  <HashRouter>
    <Route path="/header" component={Header} />
    <Route path="/contact" component={Contact} />
  </HashRouter>
);

export default App;
```

The only difference lies under the hood where the Browser Router uses the
History API while the Hash Router doesn't.
