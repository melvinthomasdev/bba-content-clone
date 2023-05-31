In React Native we will be dealing with two different types of packages, normal
JavaScript packages and packages with native dependencies. We can install any
JavaScript package using the `yarn add package-name` command. There are no extra
steps required.

For native dependencies, in addition to `yarn add package-name` we should run
`pod install` from the `ios` directory. No additional steps for Android. That's
it, thanks to Autolinking!

> Starting from React Native 0.60 packages are auto-linked. So we should not do
> any steps mentioned in the Manual linking section of a package including
> `npx react-native link package-name`.

Check out this [doc](https://github.com/react-native-community/cli/blob/master/docs/autolinking.md#how-does-it-work) to learn about how auto linking works.

## What is Manual Linking?

Before React Native 0.60 we had to manually link packages with native
dependencies that involved a series of native file changes in both iOS and
Android.
