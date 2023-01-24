Most of the time, all you're ever going to need is the `t` function detailed on the previous page. However, an edge case we haven't covered is when you need to translate a string that contains an HTML node like the `strong` or `a` tag as shown in the component below:

```jsx
import React from "react";

const IntroText = ({ user: {name, eventsCount} }) => (
  <p>
    Welcome, <strong>{name}</strong>. You have {eventsCount} events scheduled today.
  </p>
);

export default IntroText;
```

If you wish to translate the contents of the `p` tag along with the `strong` HTML tag, we can use the `Trans` component from the `react-i18next` library like so:

```jsx
import React from "react";
import { Trans } from "react-i18next";

const IntroText = ({ user: {name, eventsCount} }) => (
  <p>
    <Trans i18nKey="userWelcomeMessage" count={count}>
        Welcome, <strong>{{name}}</strong>. You have {{count: eventsCount}} events scheduled today.
    </Trans>
  </p>
);

export default IntroText;
```

The translation string for which would look akin to

```json
{
  "welcome_text_one": "Welcome, <1>{{name}}</1>, You have {{count}} event scheduled.",
  "welcome_text_other": "Welcome, <1>{{name}}</1>, You have {{count}} events scheduled."
}
```

As part of best practices, we highly recommend using Interpolation as shown in the previous chapter or the `Trans` component rather than breaking sentences into multiple translation keys.

Changing languages could cause sentence structures to break badly if we pre-break them in English.