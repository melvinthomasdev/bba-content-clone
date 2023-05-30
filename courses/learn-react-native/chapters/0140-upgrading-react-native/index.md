- ### [React Native docs on upgrading](https://reactnative.dev/docs/upgrading)

  The docs list two methods for upgrading React Native projects without expo:

  - Running `npx react-native upgrade`.
  - Using the React Native community upgrade helper.

- ### [React Native community upgrade helper](https://react-native-community.github.io/upgrade-helper)

  This online tool shows the diff between two different React Native versions.
  If `npx react-native upgrade` does not work, we can use this tool to manually
  update the files in order to upgrade React Native.

  The upgrade helper needs two pieces of information to show a complete diff of
  the files between any two versions of React Native:

  1. The current version of React Native, ex: `0.64.0`.
  2. The version we would like to upgrade to, ex: `0.66.0`.

  Click on the gear icon in the upgrade helper to enter the app name. This is
  important because some file changes include the app name. The upgrade tool
  uses `RnDiffApp` as the default app name. We want to make sure it is the app
  name we are using, and not `RnDiffApp`.

  The next step would be to go through each file in the diff and update the
  files manually, starting with `package.json`.

  **Note:** Sometimes the upgrade helper will include changes to the
  `ios/app_name.xcodeproj/project.pbxproj` file. Do not update this file
  manually, it is updated automatically after running `pod install`. Read this
  thread on the React Native community upgrade support repo for more information
  on how to update the `project.pbxproj` file correctly:
  [React Native community upgrade support issue #13](https://github.com/react-native-community/upgrade-support/issues/13).

  After updating the files, run the following commands in a terminal:

  - Run `yarn install` in the project root directory.
  - From the project root directory run `cd ios` and then
    `rm -rf Pods && rm Podfile.lock` (optional but recommended).
  - Run `pod install` inside the `ios` directory.
  - Finally, run the android and iOS builds to make sure that there are no build
    issues.

- ### [React Native community upgrade support repo](https://github.com/react-native-community/upgrade-support)

  This github repo is useful when we are really stuck during the upgrade process
  to look for an existing issue that solves the problem, or to create a new
  issue to get help from the repo contributors.

### Some tips:

- To make the upgrade a little less painful, pick two versions that are as close
  to each other as possible. For example, if the project is using React Native
  `0.64.0` and we need to upgrade to `0.66.0`, try upgrading to `0.65.0` or even
  `0.64.1`. After successfully upgrading to the next closest version we can try
  upgrading to subsequent versions before we finally upgrade to the target
  version. Doing this will minimize the number of build issues we have to deal
  with after an upgrade.

- If the application is small, and upgrading individually to each version is too
  much of a pain, then it might also be a good idea to start a new project from
  scratch with the latest React Native version and port the code over.

### Dealing with build issues after an upgrade

- Build issues that involve libraries/npm modules can usually be fixed by
  upgrading the library.
- It is also a good idea to check the github issues of the library for
  discussions on similar build issues. Sometimes, maintainers of the library
  will post workarounds or fixes that we can use.
