## The React Fragment

Another key rule to keep in mind is that React **always** requires a single root element.
Making a block of JSX without one will cause an error like so:

```jsx
{/* JSX */}
<h1>Welcome to JSX</h1>
<p>Please do enjoy your stay</p>
```

To fix this, you could wrap your code in a `div` or a similar element as shown:

```jsx
{/* JSX */}
<div>
  <h1>Welcome to JSX</h1>
  <p>Please do enjoy your stay</p>
</div>
```

But wrapping your code in a div is not always viable. A couple of examples are:

* When your JSX elements need to be styled by a CSS child selector from a parent tag or component.
* When your JSX consists of table rows to place inside a table.

You'll more often than not find yourself wanting to use your code without an extra parent element, and here is where **React fragments** come to your rescue. A React fragment looks like a tag with no name and can hold children within (`<> ... </>`)

The above code example using a React fragment instead of a div would look like this:

```jsx
{/* JSX */}
<>
  <h1>Welcome to JSX</h1>
  <p>Please do enjoy your stay</p>
</>
```

Using this component will allow you to render the insides of the fragment without wrapping them in a container element that modifies your HTML tree.

## When not to use Fragments

If you already have a root element, wrapping it inside a fragment as shown below is redundant.

```jsx
<>
  <div className="flex">
    <p>P1</p>
    <p>P2</p>
  </div>
</>
```

