## React.Fragment vs div

`React.Fragment` or `<>` component is used to group a list of children inside a
React component without adding an extra node to the DOM tree. For example:

```jsx
import React from "react";

const TaskList = ({ tasks }) => (
  <>
    {tasks.map(task => (
      <>
        <h2>{task.title}</h2>
        <p>{task.description}</p>
      </>
    ))}
  </>
);
```

In the above component, fragments are used to group a list of tasks. However,
fragments shouldn't be overused. Often developers wrap the component within
fragments despite already having the presence of a top level wrapper tag. For
example:

```jsx
import React from "react";

const TaskList = ({ tasks }) => (
  <>
    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        {tasks.map(task => (
          <tr>
            <td>{task.title}></td>
            <td>{task.description}</td>
          </tr>
        ))}
      </tbody>
    </table>
  </>
);
```

In the above component `table` is a top level HTML tag which encloses it's
children. In such a case, Fragments needn't be used as it doesn't add any value.

```jsx
// Bad
return (
  <div>
    <Button label="Save changes" />
    <Button label="Discard" />
  </div>
);

// Bad
return (
  <React.Fragment>
    <Button label="Save changes" />
    <Button label="Discard" />
  </React.Fragment>
);

// Good
return (
  <>
    <Button label="Save changes" />
    <Button label="Discard" />
  </>
);
```

Note that you should not use the shorthand inside loops. This will not allow us to add `key` prop to the component. So, it will introduce some unanticipated bugs and performance problems.

```jsx
// Bad
<div>
  {users.map(user => (
    <>
      <ChildComponent1 user={user} />
      <ChildComponent2 user={user} />
    </>
  ))}
</div>;

// Good
import React, { Fragment } from "react";

<div>
  {users.map(user => (
    <Fragment key={user.id}>
      <ChildComponent1 user={user} />
      <ChildComponent2 user={user} />
    </Fragment>
  ))}
</div>;
```

React fragments aren't a substitute for the `div` tag. `div` is used to define a
division inside the React DOM tree. It is used when there is a need to group a
list of DOM elements within one block. Fragments cannot be used here as they are
not a part of the DOM tree. For example:

```jsx
import React from "react";

const Article = () => (
  <>
    <div style={{ color: "grey" }}>
      <p>This is a paragraph in the article.</p>
    </div>
    <div style={{ fontSize: "1rem" }}>
      <p>This is another paragraph in the article.</p>
    </div>
  </>
);
```

In the above example, `div` tags are used to divide the break down the article
into separate sections. Same couldn't have been achieved using fragments.
Fragments however can be used to group these sections together because these
sections are children of the `Article` component.

You can use the
[jsx-no-useless-fragment](https://github.com/yannickcr/eslint-plugin-react/blob/master/docs/rules/jsx-no-useless-fragment.md)
ESLint plugin to check for any unnecessary fragments in your code.

## Using appropriate tags

Often developers use inappropriate tags to serve a purpose they are not meant to
serve by hacking the tag to behave like another. For example, styling a `div`
tag as an `inline` component whereas to do so a `span` tag should be used. Or
hacking a `div` tag to create a horizontal line like this:

```jsx
import React from "react";

const Article = () => (
  <>
    <div style={{ color: "grey" }}>
      <p>This is a paragraph in the article.</p>
    </div>
    <div
      style={{
        borderStyle: "solid",
        borderWidth: "1rem",
        borderColor: "grey",
        height: "1rem",
        width: "100%",
      }}
    ></div>
    <div style={{ fontSize: "1rem" }}>
      <p>This is another paragraph in the article.</p>
    </div>
  </>
);
```

The `div` tag in the above component which is acting like a horizontal line can
be replaced with an `hr` tag like this:

```jsx
import React from "react";

const Article = () => (
  <>
    <div style={{ color: "grey" }}>
      <p>This is a paragraph in the article.</p>
    </div>
    <hr />
    <div style={{ fontSize: "1rem" }}>
      <p>This is another paragraph in the article.</p>
    </div>
  </>
);
```

You can refer to https://www.w3schools.com/tags/default.asp for a list of HTML
tags and their right usages.
