Making API requests to a server running in the local machine(`localhost`) is a
little tricky in React Native.

In iOS, it's quite simple, requesting `http://localhost` will directly connect
to the computers `localhost`. But if we try the same thing in Android it won't
work. The reason being that `localhost`/`127.0.0.1` in Android points to the
device's `localhost` not the computers.

There are different ways to get around this.

### Method 1 (recommended)

In Android, we can use the IP `10.0.2.2` to access computers `localhost`.

```
const baseUrl = Platform.OS === 'android' ? 'http://10.0.2.2' : 'http://localhost';
```

In a project, we can use the above logic to decide what `baseUrl` to use based
on the platform. Afterwards, we can use this `baseUrl` for all APIs.

### Method 2

The second method is to stick with `localhost` itself and use the
[React Native Debugger(RND)](https://github.com/jhen0409/react-native-debugger)
to route the connection to the computers `localhost`. To do this, first, we have
to enable **Debug Mode** from the device debug menu and then we have to turn on
**Network inspect** from RND.

When using this approach there won't be any change in the code for Android. But
we always have to connect RND for this to work.
