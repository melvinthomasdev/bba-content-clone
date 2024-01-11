For several years, web developers kept content in `HTML`, design in `CSS`, and logic in `JavaScript` — often in separate files. The content was marked up inside HTML, while the page’s logic lived separately in JavaScript.

But with this approach, developers had to deal with a large amount of code duplication, mainly when multiple pages use the same UI and logic. Also, as the Web became more interactive, logic increasingly determined content. As a result, it became painful to change UI in response to user interactions using DOM manipulation.

React is a JavaScript library that simplifies development by addressing these pain points. React lets us build user interfaces from individual reusable pieces called **components**. We can create our components and use them just like HTML elements. We can then combine them into entire screens, pages, and apps. React will take care of preparing the DOM for us.

In addition, React optimizes application performance by selectively updating only the modified portion of the DOM. React uses a **Virtual DOM**, a lightweight representation of the DOM, to compare the changes and only applies the DOM updates necessary to bring the DOM to the desired state.

React brings several additional features and tools to the table that enhance the development experience.

**Hot reloading** is a feature that allows developers to see the changes they make in their code instantly reflected in the application without manually refreshing the page.

React also comes with the **React Developer Tools** browser extension making debugging and optimization easier. The components panel of React Dev tools lets developers inspect React components. Developers can debug React components by editing `props` and `states` from the browser itself. We will discuss in the upcoming chapters how we can use `props` and `states` in React to prepare and update the UI.

The **Profiler** panel of the React dev tools helps us record the performance information of our application. It measures how often a React component renders. It helps to identify the parts of the application which are slow so that the developer can optimize it for better performance.

We will take you through these concepts in detail in upcoming chapters.
