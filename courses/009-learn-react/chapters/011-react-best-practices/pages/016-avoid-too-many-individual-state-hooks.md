## The problem

Too many useState hooks can make your code _spaghetti code_. It'll be hard to
maintain as it keeps growing. Here is an example of spaghetti state management:

```javascript
const Themes = () => {
  const [themes, setThemes] = useState({ themes: [], customThemes: [] });
  const [isTemplateLoading, setTemplateLoading] = useState(false);
  const [isCloneDefaultTheme, setIsCloneDefaultTheme] = useState(false);
  const [templateCodeChanged, setTemplateCodeChanged] = useState(false);
  const [isAlertOpen, setIsAlertOpen] = useState(false);
  const [themeName, setThemeName] = useState("");
  const [originalThemeName, setOriginalThemeName] = useState("");
  const [currentTab, setCurrentTab] = useState(TABS.themes);
  const [configuration, setConfiguration] = useState({});
  const [previewUrl, setPreviewUrl] = useState(null);
  const [publishedTheme, setPublishedTheme] = useState(null);
  const [organizationThemeId, setOrganizationThemeId] = useState(null);
  const [savedConfig, setSavedConfig] = useState({});
  const [templateContent, setTemplateContent] = useState("");
  const [savedTemplateContent, setSavedTemplateContent] = useState("");
  const [template, setTemplate] = useState({});
  const [templateId, setTemplateId] = useState(null);
  const [organizationThemeTemplates, setOrganizationThemeTemplates] = useState(
    []
  );
  const [initialLoad, setInitialLoad] = useState(true);
  const [cloneTemplate, setCloneTemplate] = useState(null);
  const [groupedTemplates, setGroupedTemplates] = useState({});
  const [typographs, setTypographs] = useState([]);
};
```

This would mean that sending the states and state handlers to child components
become messy too:

```javascript
<ThemeSidebar
  themes={themes}
  template={template}
  themeName={themeName}
  currentTab={currentTab}
  configuration={configuration}
  groupedTemplates={groupedTemplates}
  isTemplateLoading={isTemplateLoading}
  organizationThemeId={organizationThemeId}
  typographs={typographs}
  setThemeName={setThemeName}
  setCurrentTab={setCurrentTab}
  setTemplateId={setTemplateId}
  setIsAlertOpen={setIsAlertOpen}
  setOrganizationThemeId={setOrganizationThemeId}
/>
```

This wasn't an issue in class components since it was all handled in a single
state object and a `setState()` method.

## The solution

There are many ways to fix this issue such as using
[useReducer](https://reactjs.org/docs/hooks-reference.html#usereducer) hook. But
the easiest and most familiar way to handle this is to have a state management
solution similar to the one in class components. For that we can use the
[useSetState](https://github.com/streamich/react-use/blob/master/docs/useSetState.md)
custom hook. The above code can be simplified to:

```javascript
import { useSetState } from "react-use";

const Themes = () => {
  const [state, setState] = useSetState({
    isTemplateLoading: false,
    isCloneDefaultTheme: false,
    templateCodeChanged: false,
    isAlertOpen: false,
    themeName: "",
    originalThemeName: "",
    currentTab: TABS.themes,
    configuration: {},
    previewUrl: null,
    publishedTheme: null,
    organizationThemeId: null,
    savedConfig: {},
    templateContent: "",
    savedTemplateContent: "",
    template: {},
    templateId: null,
    organizationThemeTemplates: [],
    initialLoad: true,
    cloneTemplate: null,
    groupedTemplates: {},
    typographs: [],
  });
  setState({ themeName: "My theme" });
};
```

This would make passing states and their handlers to child components much
easier:

```javascript
<ThemeSidebar themeStates={state} setThemeStates={setState} />
```

## Avoid declaring states unnecessarily

Creating unwanted state variables for storing data received through an API call
should be avoided when the data structure is intact. For example, consider a
component that renders a page containing the user data which is fetched from the
backend using an API.

If the data received from the backend is an object containing the user details
such as name and email then you should not have separate state variables for
name and email. Instead you should save the entire user object in a single state
variable. If need be you can destructure it later like so:

```jsx
const User = ({ props }) => {
  // good
  const [user, setUser] = useState({});

  const { name, email } = user;

  //bad
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
};
```
