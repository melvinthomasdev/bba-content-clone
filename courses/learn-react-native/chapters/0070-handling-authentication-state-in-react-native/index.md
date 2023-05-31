Authentication flow is an essential part of any modern mobile application. In
this article, we will see how to store and manage the authentication state in
React Native.

## Storing auth data

Let's consider a basic scenario where we use a phone number and authentication
token for verifying API requests. Here we need to persist both the phone number
and authentication token. For storing these data we can use AsyncStorage, which
is a key-value data store commonly used to persist data locally in React Native.
Even though we are storing two different values, we will always access them
together and hence we can avoid multiple AsyncStorage calls by storing them as a
single key-value pair.

```javascript
const auth = {
  phone: PHONE_NUMBER, // User's phone number
  token: AUTH_TOKEN, // Authentication token
};

AsyncStorage.setItem("auth", JSON.stringify(auth));
// AsyncStorage supports only string values - so we have to serialize our object.
```

After storing the data we can use the `AsyncStorage.getItem()` API to retrieve
it.

### Things to keep in mind while using AsyncStorage

It should be clear from the name that AsyncStorage calls are asynchronous so
consider the following while using it.

- Avoid unnecessary AsyncStorage calls - Async calls will take time and may
  affect user experience.

- Reuse data once fetched - Use higher-level state or central state management
  like Context, Redux etc to manage data used in multiple places.

- Asynchronous calls might fail and we should handle exceptions properly.

- In Android, AsyncStorage has a 6MB hard limit. You can change it by setting
  `AsyncStorage_db_size_in_MB` value in `gradle.properties` file.

- AsyncStorage uses SQLite so beware of
  [SQLite limits](https://www.sqlite.org/limits.html).

## Manage auth state globally with Context API

In many apps we would use the current authentication state to display
appropriate content based on auth state, user type etc., so it's always good to
put it in a centrally accessible place. We can use a central state management
library like Redux or Context API. In this example we will use the built-in
Context API.

Let's create an AuthContext and store all auth data in the Provider state by
fetching it from AsyncStorage. We will also an API to update the data in state &
AsyncStorage.

### AuthContext

```javascript
// Create a context
const AuthContext = createContext({});

const AuthProvider = ({ children }) => {
  const [auth, setAuthState] = useState(initialState);

  // Get current auth state from AsyncStorage
  const getAuthState = async () => {
    try {
      const authDataString = await AsyncStorage.getItem("auth");
      const authData = JSON.parse(authDataString || {});
      // Configure axios headers
      configureAxiosHeaders(authData.token, authData.phone);
      setAuthState(authData);
    } catch (err) {
      setAuthState({});
    }
  };

  // Update AsyncStorage & context state
  const setAuth = async (auth) => {
    try {
      await AsyncStorage.setItem("auth", JSON.stringify(auth));
      // Configure axios headers
      configureAxiosHeaders(auth.token, auth.phone);
      setAuthState(auth);
    } catch (error) {
      Promise.reject(error);
    }
  };

  useEffect(() => {
    getAuthState();
  }, []);

  return (
    <AuthContext.Provider value={{ auth, setAuth }}>
      {children}
    </AuthContext.Provider>
  );
};

export { AuthContext, AuthProvider };
```

When using axios we can configure the default auth headers and they will be used
for all API requests. In case you are not using axios you can still get auth
values from the context.

```javascript
const configureAxiosHeaders = (token, phone) => {
  axios.defaults.headers["X-Auth-Token"] = token;
  axios.defaults.headers["X-Auth-Phone"] = phone;
};
```

Now we can wrap our root component with `AuthProvider` and use the
`useContext()` API in any component to access the auth state.

## Restricting routes(screens)

Displaying appropriate screens and restricting access to screens based on the
auth state is a common use case. In this section, we will see how to display
Login/Signup screens if the user is not authenticated and a Home screen if the
user is already authenticated.

```javascript
const App = () => {
  // Get auth state from context
  const { auth } = useContext(AuthContext);

  return (
    <NavigationContainer>
      <Stack.Navigator>
        {auth.token ? (
          <Stack.Screen name="Home" component={Home} />
        ) : (
          <>
            <Stack.Screen name="Signup" component={Signup} />
            <Stack.Screen name="Login" component={Login} />
          </>
        )}
      </Stack.Navigator>
    </NavigationContainer>
  );
};
```

In the above snippet, we are conditionally rendering screens based on the auth
token rather than doing manual navigation using `navigate` function. This will
help us restrict access to screens and avoid accessing restricted screens when
navigating from code or using the system back button in android.

### Things to keep in mind while using react navigation

- Try to keep all top-level StackNavigator screens in one place to avoid
  unexpected behaviour.

- Use conditional rendering to restrict screens.

- Use `replace` instead of `navigate` when you want to remove the current screen
  from the back stack.

- Use constants for screen names instead of string literals.

## Enhancements

- Store additional pieces of information like user type, username etc in the
  Auth context for easier access.

- Improve AuthContext by using useReducer instead of useState.

- Consider using state management libraries like Redux if you want to manage
  lots of states globally.

- Use a loader state to display a SplashScreen until we fetch the auth state
  from AsyncStorage for the first time.
