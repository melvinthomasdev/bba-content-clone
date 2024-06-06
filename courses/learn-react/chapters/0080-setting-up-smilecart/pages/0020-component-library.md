While developing large applications, we may need styled buttons, inputs, and other UI elements. Creating components for each of them can be time-consuming and tedious. You will also need to test them, and make sure they work well on different devices and browsers.

This is where component libraries come into play. Component libraries are collections of ready-made components that we can use in our projects. They save our time and effort by providing us with common UI elements that are already designed, coded, and tested.

Component libraries offer UI elements packaged as React components, which can be customized by providing specific prop values based on our needs.

Some popular component libraries for React are [Chakra UI](https://chakra-ui.com), [Material UI](https://mui.com), and [Antd](https://ant.design).

At BigBinary, we have developed an in-house component library named neetoUI. neetoUI is a collection of beautiful and responsive components that follow the neeto design system.

neetoUI provides us with components such as Buttons, Input, Modal, Table, Alert, and many more. We can customize them by passing different props as per our needs.

You can explore the neetoUI components on its [official website](https://neeto-ui.neeto.com).

## Setup neetoUI

Step 1. Install neetoUI and its peer dependencies using the following commands:

```
yarn add @bigbinary/neetoui@5.2.41

yarn add react-toastify@9.0.1 formik@2.2.0 react-router-dom@5.2.0 @bigbinary/neeto-icons@1.17.6 antd@4.24.3 i18next@21.7.0 @emotion/is-prop-valid@1.2.0 @bigbinary/neeto-cist@1.0.6
```

Step 2. To get the styles working, import neetoUI and ReactToastify stylesheets to the main `CSS` entry point. In our project, the `src/index.css` file serves as the entry point for `CSS`. Replace the contents of `src/index.css` with the following lines:

```css
@import "@bigbinary/neetoui";
@import "react-toastify/dist/ReactToastify.min.css";
```

Let's commit the new changes:

```bash
git add -A
git commit -m "Setup neetoUI"
```

Once you have set up `neetoUI`, you can import and use `neetoUI` components by passing props according to your requirements. Here is an example that uses the `Button` component from `neetoUI`:

```jsx
import React from "react";

import { Button } from "neetoui";

const App = () => <Button label="Click me" style="secondary" />;

export default App;
```

That’s it! We have learned how to use the neetoUI component library. We'll be using the neetoUI component library to build our project.

You can verify the changes [here](https://github.com/bigbinary/smile-cart-frontend/commit/a02fec0c9c5244feb7475fe2d69edcb8f11ea680).

To learn why `neetoUI` is not imported as `@bigbinary/neetoui` but used as `neetoui`, please refer to [Path aliases](https://courses.bigbinaryacademy.com/learn-react/miscellaneous/setting-up-template-repository/#path-aliases).
