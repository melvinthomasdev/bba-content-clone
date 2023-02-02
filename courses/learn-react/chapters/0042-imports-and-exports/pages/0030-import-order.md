As a general rule of thumb, it is suggested to keep relative imports at the bottom and aliased/library imports at the top.

```jsx
import React, { Component } from 'react';
import Toolbar from '../Toolbar';
import SqlOutput from './SqlOutput';
import Fade from 'react-reveal/Fade';
import debounce from 'lodash/debounce';
import Editor from '../Editor';
import sqljs from 'sql.js';
```

Could be redefined as

```jsx
import React, { Component } from 'react';
import Fade from 'react-reveal/Fade';
import debounce from 'lodash/debounce';
import sqljs from 'sql.js';

import SqlOutput from './SqlOutput';
import Toolbar from '../Toolbar';
import Editor from '../Editor';
```