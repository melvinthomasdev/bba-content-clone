When you need to pass along lots of props to a child component as shown:

```jsx
{/* Container.jsx */}
const Container = ({ users, darkMode, isAdmin, text }) => (
  <div className="container">
    <UserCards
      users={users}
      darkMode={darkMode}
      isAdmin={isAdmin}
      text={text}
    />
  </div>
)
```

you can always use the spread syntax to pass all props to a child like this:

```jsx
{/* Container.jsx */}
const Container = props => (
  <div className="container">
    <UserCards {...props}/>
  </div>
)
```

If you need to use a few and pass on the rest, you can also partially spread your components like this:

```jsx
{/* Container.jsx */}
const Container = ({ text, ...cardProps }) => (
  <div className="container">
    <UserCards {...cardProps}/>
    {text}
  </div>
)
```

While concise and convenient, do note that you shouldn't be creating massive chains of props that keep getting passed down. In such cases, you'd be better served by using either the `children` prop or React contexts as will be explained in the coming chapters.

Also, do note that props are immutable. Do not try and modify them.
Modifications to certain special props are done through `states` but we'll get to it in the next couple of sections.
