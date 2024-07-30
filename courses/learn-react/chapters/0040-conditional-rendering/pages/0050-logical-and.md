When working with React, you will encounter situations where you want to render some JSX only when a particular condition is true. In all other cases, you do not need to render anything. In such situations, the logical AND (`&&`) operator comes in handy.

Hence, we can update the example from the previous chapter using the `&&` operator like this:

<codeblock language="reactjs" type="lesson">
const Book = ({ isFavorite, name }) => (
  <li>
    {name} {isFavorite && "⭐️"}
  </li>
);

const BookList = () => (
  <ul>
    <Book isFavorite name="Psychology of Money" />
    <Book name="Rich dad, poor dad" />
  </ul>
);

export default BookList;
</codeblock>

In the above example, a ⭐️ is rendered next to the name of the book when the `isFavorite` prop is truthy. When the value of `isFavorite` is falsy, the expression `isFavorite && "⭐️"` returns the falsy value contained in the `isFavorite` prop. Since, JSX does not render `null`, `undefined`, and ***boolean*** values, the rendered output will only contain the name of the book.

Points to keep in mind while using the `&&` operator in React:

**Short circuiting**: The `&&` operator will return falsy value as soon as it encounters any falsy value. If all the values are truthy, then it will return the last value. Consider the following:

```jsx
null && "Hello World!"                 // evaluates to null

0 && "Hello World!"                    // evaluates to 0

false && "Hello World!"                // evaluates to false

anyOtherFalsyValue && "Hello World!"   // evaluates to `anyOtherFalsyValue`

true && "Hello"                        // evaluates to "Hello"

[] && "Hello"                          // evaluates to "Hello", empty array is truthy

anyOtherTruthyValue && "Hello"         // evaluates to "Hello"

true && 1 === 1 && "Hello"             // evaluates to "Hello"
```

**Avoid putting numbers on the left-hand side of &&**: Unlike any other falsy values, React renders `0` (zero) to the DOM. So, in JSX, it is not advised to put numbers on the left-hand side of `&&`.

```jsx
{0 && <div>Hello World!</div>}           // renders 0 on DOM

{2 && <div>Hello World!</div>}           // renders the div on DOM

{usersArray.length && <div>Hello</div>}  // renders 0 if usersArray is empty, renders the div otherwise
```

To avoid this issue, make sure to use comparison operators (`>,` `<`, `===,` etc.) or double negation (`!!`) on the left-hand side. This will ensure that the expression is evaluated as a boolean when LHS is falsy.

```jsx
// In both the following cases, React renders div if usersArray is not empty.
// Nothing is rendered if usersArray is empty.

{usersArray.length > 0 && <div>Hello World!</div>}

{!!usersArray.length && <div>Hello World!</div>}
```

Note that this caveat only lies with numbers. The `&&` operator behaves as expected when used with all other kinds of values including objects and arrays. Objects and arrays are considered truthy, therefore, using the `&&` operator with objects and arrays is safe and will not cause any unexpected behaviour.
