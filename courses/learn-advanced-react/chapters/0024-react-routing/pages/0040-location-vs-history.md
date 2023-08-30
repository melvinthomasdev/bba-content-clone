As explained previously, you should prefer the usage of `<Link>` components over `<a>` tags when navigating to a location inside the app.

Similarly, when jumping to a new location from inside a function, developers sometimes use `window.location.href` instead of the history API. It is very important to understand the difference between the two and when to use them.

## window.location.href

The `window.location` object in JavaScript has many properties of which, the `window.location.href` property returns the current page address or "URL".

You can update the URL by assigning a new value to it like so:

```js
const LinkButton = () => (
  <button onClick={
    () => window.location.href = "https://example.com"
  }>
    Jump to the example site
  </button>
)

export default LinkButton
```

Clicking the button navigates the browser to `example.com` and creates an HTTP request as though you're visiting a new page.

This can be used to navigate to a different webpage but can also be used to log out a user and return them to the login page. Using this method resets the state information and thus ensures there is no exposed data that should only be accessible to a logged-in user.

## History API

React router's History API makes use of the HTML5 History API. You can use it to navigate to routes that have been defined using the `BrowserRouter` and `Route` as shown in the previous pages. For example, a link button to a contact component within our app would look like this:

```jsx
import { useHistory } from "react-router-dom";

const LinkButton = () => {
  const history = useHistory();

  return (
    <button onClick={
      () => history.push("/contacts")
    }>
      Jump to Contacts
    </button>
  )
}
```

The `history.push` method pushes the `contacts` URL onto the history stack. It does not revisit the page and make a new HTTP request, making in-app navigation faster but preventing external links.

If you need to, you can also send a state object over to the contacts component by passing it as a second argument to the `history.push` method like so: `() => history.push("/contacts", {country: "India"})`.

Thus, the `history.push` is the preferred method of performing in-app navigation.

As mentioned earlier, the `window.location.href` does not preserve state while `history.push` does. This does have the consequence of making `history.push` unsuitable for redirection to the login page upon logout, since the state might be preserved.

The history object also has a few other properties and methods to manipulate this "history stack" we just showed such as:
  - length - Property containing the number of entries in the stack
  - go(n) - Method to step forward or backward by n steps
  - goForward() - Method to move the pointer a step forward, equivalent to go(1)
  - goBack() - Method to move the pointer a step backward, equivalent to go(-1)

If you'd like to learn more about how to use the History API with React, check out [this article](https://www.pluralsight.com/guides/using-react-with-the-history-api) that explains many more methods and properties you can use.
