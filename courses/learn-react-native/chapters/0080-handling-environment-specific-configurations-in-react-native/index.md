Many modern-day applications now go through different stages of the product
cycle such as development, staging, production etc.

Having different environment variables for each environment will make it a lot
easier to manage any application. This article is intended to share one solution
to address this problem in React Native. We will be using a library called
[react-native-config](https://github.com/luggit/react-native-config) for this
purpose; you can also try
[react-native-dotenv](https://github.com/zetachang/react-native-dotenv).

We will be focusing on having three different bundles containing configuration
files for development, staging and production environments.

## Installing react-native-config

Install the package:

```bash
yarn add react-native-config
```

For iOS also run `pod install` after package is installed.

## Setup for Android

Add below line of code to `android/app/build.gradle` to apply plugin.

```diff
apply plugin: "com.android.application"
+ apply from: project(':react-native-config').projectDir.getPath() + "/dotenv.gradle"
```

Create three files in root folder of the project `.env.development`,
`.env.staging` & `.env.production` which will contain our environment variables.

```text
// .env.development
API_URL=https://myapi.development.com

// .env.staging
API_URL=https://myapi.staging.com

// .env.production
API_URL=https://myapi.com
```

Now we need to define `envConfigFiles` in `build.gradle` associating builds with
env files. To achieve this, add the below code before the `apply from ` call,
and be sure to leave the build cases in lowercase.

```diff
+ project.ext.envConfigFiles = [
+   productiondebug: ".env.production",
+   productionrelease: ".env.production",
+   developmentrelease: ".env.development",
+   developmentdebug: ".env.development",
+   stagingrelease: ".env.staging",
+   stagingdebug: ".env.staging"
+ ]

apply from: project(':react-native-config').projectDir.getPath() + "/dotenv.gradle"

```

Next, add `productFlavors` in `build.gradle`, just below `buildTypes`.

```text
flavorDimensions "default"
  productFlavors {
    production {}
    staging {
      // We can have build-specific configurations here. Like using applicationIdSuffix to create different package name (ex. ".staging")
    }
    development {}
  }
```

Names should match based on `productFlavors`, so `productiondebug` will match
`debug` in this case and generate debug build of App with configuration from
`.env.production`.

Also add `matchingFallbacks` in `buildTypes` as shown below:

```diff
buildTypes {
  debug {
    signingConfig signingConfigs.debug
+   matchingFallbacks = ['debug', 'release']
  }
  release {
    signingConfig signingConfigs.debug
    minifyEnabled enableProguardInReleaseBuilds
    proguardFiles getDefaultProguardFil  ("proguard-android.txt"), "proguard-rules  pro"
  }
 }
```

Add the below scripts to `scripts` in the `package.json` file.

```javascript
"android:staging": "react-native run-android --variant=stagingdebug",
"android:staging-release": "react-native run-android --variant=stagingrelease",
"android:dev": "react-native run-android --variant=developmentdebug",
"android:dev-release": "react-native run-android --variant=developmentrelease",
"android:prod": "react-native run-android --variant=productiondebug",
"android:prod-release": "react-native run-android --variant=productionrelease",
```

Now, to have a debug build with staging environment, run:

```bash
yarn android:staging
```

Or, to have a release build with staging environment, run:

```bash
yarn android:staging-release
```

## Setup for iOS

In iOS we will create three new schemes `TestAppDevelopment`, `TestAppStaging` &
`TestAppProduction` containing configuration files for development, staging and
production environments respectively.

To create schemes, open the project in xcode & do the following:

In the Xcode menu, go to Product > Scheme > Edit Scheme.

Click Duplicate Scheme on the bottom and name it `TestAppDevelopment` and check
the `shared` checkbox.

We will repeat the above steps two more times (for `TestAppStaging` &
`TestAppProduction`).

Now edit the newly generated scheme. Expand "Build" settings and click
"Pre-actions", and under the plus sign select "New Run Script Action". Select
project from the `Provide build settings from` dropdown.

Where it says "Type a script or drag a script file", type:

```bash
cp "${PROJECT_DIR}/../.env.staging" "${PROJECT_DIR}/../.env"  # replace .env.staging for your file
```

Add the below scripts to `scripts` in the `package.json` file.

```javascript
"ios:dev": "react-native run-ios --scheme 'TestAppDevelopment'",
"ios:prod": "react-native run-ios --scheme 'TestAppProduction'",
"ios:staging": "react-native run-ios --scheme 'TestAppStaging'",
```

Now, to have a build with staging environment, run:

```bash
yarn ios:staging
```

And it will run the application with staging configuration.

## Accessing environment variables

Once the setup is complete, we can access the variables as shown below:

```javascript
import Config from "react-native-config";
Config.API_URL;
//`https://myapi.staging.com`
```
