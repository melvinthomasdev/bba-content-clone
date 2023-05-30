## Firebase Remote Config

**What is Firebase?**

Google Firebase is a Google-backed application development software that enables
developers to develop iOS, Android and Web apps. Firebase provides tools for
tracking analytics, reporting and fixing app crashes, creating marketing and
product experiment.

Firebase offers a number of services, including:

1. Analytics
2. Authentication
3. Cloud messaging
4. Realtime database
5. Crashlytics
6. Performance
7. Test lab

**What is Firebase Remote Config?**

Firebase Remote Config is a cloud service that lets you change the behavior and
appearance of your app without requiring users to download an app update. When
using Remote Config, you create in-app default values that control the behavior
and appearance of your app. Then, you can later use the Firebase console or the
Remote Config backend APIs to override in-app default values for all app users
or for segments of your user base. Your app controls when updates are applied,
and it can frequently check for updates and apply them with a negligible impact
on performance.

**How Firebase Remote Config Works**

Remote Config includes a
[client library](https://www.npmjs.com/package/@react-native-firebase/remote-config)
that handles important tasks like fetching parameter values and caching them,
while still giving you control over when new values are activated so that they
affect your app's user experience. This lets you safeguard your app experience
by controlling the timing of any changes.

The Remote Config client library _**get**_ methods provide a single access point
for parameter values. Your app gets server-side values using the same logic it
uses to get in-app default values, so you can add the capabilities of Remote
Config to your app without writing a lot of code.

**Setting Up**

`npm install @react-native-firebase/app @react-native-firebase/analytics @react-native-firebase/remote-config`

Since firebase have native modules, we should install the pod libraries.
`cd ios && pod install`

Once we have installed all the required libraries, we have to set up
[firebase](https://console.firebase.google.com) account and download config
file. While creating project, make sure **_Enable Google Analytics for this
project_** is checked. Copy _google-services.json_ to _android/app_ and
_GoogleService-Info.plist_ to iOS project

Once we have completed all the installation and configuring procedures we can go
with testing the implementation

**Implementation**

We have to set the parameters in the firebase console first. We can set as many
variable as we want. To set parameters we have to navigate to remote config
section in firebase console. _**Engage -> Remote Config**_. We can set
parameters based on conditions. Suppose if we need the values to be applicable
to only one platform, we can achieve that by making use of conditions. If we're
not setting any conditions, the values gets applied for all the calls.

We then import _remoteConfig_ from _@react-native-firebase/remote-config_

```javaScript
import remoteConfig from '@react-native-firebase/remote-config'; //we can use any variable name
```

We can set the default value in client side.

```javaScript
await RemoteConfig().setDefaults({param: '1.1'}); // (optional)
```

Firebase caches the data by default. We can adjust or bypass caching by using
the _fetch_ method.

```javaScript
await remoteConfig().fetch(300); //(optional). Pass the caching time in seconds. 0 will disable caching. Default is 12 hours
```

Once we have set up default values and caching then we have to fetch the data
from server and then activate the values.

```javaScript
const activated = await RemoteConfig().fetchAndActivate();
```

If _activated_ is true, then we can read the data from the server. If the remote
data and last fetched data are the same, then _activated_ will be false in
_android_ and old values will be returned in _iOS_.

Firebase provides multiple ways to read the data from server.

1. getAll() => _returns all the parameters set in the firebase console based on
   condition(s) (if there any)_
2. getBoolean(key) => _returns the value in boolean_
3. getNumber(key) => _returns the value as number_
4. getString(key) => _returns the value as string_
5. getValue(key) => _returns an object with source and value_

**Sample Code**

```javaScript
const fetchRemoteData = async () => {
    try {
      await RemoteConfig().setDefaults({test: '1.1'}); // setting default value
      await RemoteConfig().fetch(10); // 10 seconds cache
      const activated = await RemoteConfig().fetchAndActivate(); //can read remote data if true
      if (activated) {
        const values = await RemoteConfig().getAll();//returns all values set in remote
        console.log(values);
      }
    } catch (error) {
      console.log(error.message);
    }
  };
```
