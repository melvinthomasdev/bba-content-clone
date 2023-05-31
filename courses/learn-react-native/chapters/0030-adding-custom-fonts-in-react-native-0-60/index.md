Custom fonts can be added into React Native project(0.60+) with the following
steps.

### 1. Get the font files needed for the project

The font files should be either in .ttf or .otf format. The font files can be
obtained from [Google fonts](https://fonts.google.com/). Create a folder named
`fonts` under the assets directory and place the font files in it.

### 2. Create a configuration file

Create a configuration file named `react-native.config.js` in the root project
directory and add the following code:

```javaScript
    module.exports = {
        project: {
            ios:{},
            android:{}
        },
        assets:['./assets/fonts/'],
    }
```

### 3. Link the font assets

Link the newly added asset by running the following command:

> yarn react-native link

or

> npx react-native link

That's all, the font is now added and we can see the new font assets in
android/app/src/main/assets/fonts in the case of android and changes in the
Info.plist in case of iOS. Finally, re-run the app.
