As explained in the previous chapter, we use `PascalCase` to name our custom
components. This is because, in JSX, tag names that start with a lowercase
letter are considered to be HTML tags.

This is best demonstrated by showing how both types of components are rendered:

```jsx
<HelloWorld />
// Compiles to React.createElement(HelloWorld, null, null)

<div />
// Compiles to React.createElement('div', null, null)
```

If you tried to define and call the `HelloWorld` component as `helloWorld`, the
transpiled code would look like this:

```jsx
<helloWorld />
// Compiles to React.createElement('helloWorld', null, null)
```

The above transpiled code makes React look for a `helloWorld` HTML tag that
doesn't exist and thus won't run.
