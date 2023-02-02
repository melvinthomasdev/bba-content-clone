Every state is private to each component, once defined in a component it can only be used within that component or passed down to its children via props.

Here's an example of an app with a `NextPageButton` and `PageNumberDisplay` component but with a critical bug in it:

```jsx
{/* App.jsx */}
import { useState } from 'react';

const App = () => (
  <div className="footerFlex">
    Page Contents
    <PageNumberDisplay />
    <NextPageButton />
  </div>
)

const NextPageButton = () => {
  const [page, setPage] = useState(0);

  return (
    <button onClick={() => setPage(prevPage => prevPage + 1)}>
      Go to next page >
    </button>
  )
}

const PageNumberDisplay = () => {
  const [page, setPage] = useState(0);

  return (
    <span>
      Page #{page}
    </span>
  )
}
```

In the above example, `NextPageButton` and `PageNumberDisplay` have states that run independently of one another. Changing the page in `NextPageButton` does not reflect on the page shown in `PageNumberDisplay`.

To have a synced state between any 2 components, the state must be defined in a common ancestor and passed down as needed. This is generally the nearest common parent. The earlier example corrected should instead look like this:

```jsx
{/* App.jsx */}
import { useState } from 'react';

const App = () => {
  const [page, setPage] = useState(0);
  const advancePage = () => setPage(prevPage => prevPage + 1)

  return (
    <div className="footerFlex">
      Page Contents
      <PageNumberDisplay page={page}/>
      <NextPageButton advancePage={advancePage}/>
    </div>
  )
}

const NextPageButton = {( advancePage )} => (
  <button onClick={advancePage}>
    Go to next page >
  </button>
)

const PageNumberDisplay = {( page )} => (
  <span>
    Page #{page}
  </span>
)
```

Now, when the page number is increased in `NextPageButton`, it will show the correct page in `PageNumberDisplay`.