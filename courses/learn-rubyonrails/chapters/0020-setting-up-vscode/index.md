VSCode, short for Visual Studio Code, can be downloaded and installed from
[their official website](https://code.visualstudio.com/download).

If you're using M1 Mac, then you can opt for `Apple Silicon` build and download
it from their website.

These are the steps for installation:

- Download Visual Studio Code for macOS.
- Open the browser's download list and locate the downloaded archive.
- Select the 'magnifying glass' icon to open the archive in Finder.
- Drag `Visual Studio Code.app` to the `Applications` folder, making it
  available in the macOS Launchpad.
- Add VSCode to your Dock by right-clicking on the icon to bring up the context
  menu and choosing `Options > Keep in Dock`.

Most of us in BigBinary use VSCode as our daily tool for editing files. Thus if
you ever wanted to check out how to do something faster or better in VSCode,
then your colleagues are always there to help you out!

## Enable code command

To run VSCode from terminal, we need to add `code` command in to our `PATH`.

There are two ways to do this.

First method is from VSCode itself:

- Go to VSCode application.

- Press "Shift" button, "Command" button and "p".

- Type > shell command.

- Select "Install 'code' command in PATH.

- VSCode will give you a prompt. Click "Ok".

- VSCode will ask for your laptop password. provide password.

Or you can add it manually from your terminal itself without opening VSCode,
like mentioned below.

**Note:** You don't need to run below command if you had already added to `PATH`
from VSCode.

For Zsh users, run the following command from your terminal:

```bash
cat << EOF >> ~/.zshrc
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
```

Since we have made changes to `.zshrc` we need to reload the shell for the
changes to take effect. The easiest way to do so is to quit the current terminal
and open a new terminal.

Now let's test if command `code` is working or not.

Open terminal and type `code dummy.txt` and that file should be opening up in
VSCode.

## Enabling auto save feature

`Auto Save` feature will save your changes after a configured delay or when
focus leaves the editor.

With this option turned on, there is no need to explicitly save the file.

The easiest way to turn on Auto Save is with the `File > Auto Save` toggle from
menu bar, that turns on and off save option after a delay.

Other way of enabling this feature, is by appending the following to your user
settings and reload. It does the same job:

```json
{
  // rest of the keys as it was
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000
}
```

## Install recommended extensions

VSCode provides many extensions which can improve our coding experience. Here are some VS Code extensions that we recommend using to enhance productivity:

- [bradlc.vscode-tailwindcss](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss): For getting tailwind classes IntelliSense

- [kaiwood.endwise](https://marketplace.visualstudio.com/items?itemName=kaiwood.endwise): Automatically add end when we open a do block in ruby

- [Shopify.ruby-lsp](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp): Ruby language support & Basic IntelliSense

- [redhat.vscode-yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml): YAML Language support

- [editorconfig.editorconfig](https://marketplace.visualstudio.com/items?itemName=editorconfig.editorconfig): Override user/workspace settings with settings found in .editorconfig files

- [dbaeumer.vscode-eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint): Integrates ESLint into VS Code and shows errors and warnings while writing the code.

- [streetsidesoftware.code-spell-checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker): Spell checker which detects typos in code. It automatically comprehends camelCase, snake_case, and other coding styles & splits words accordingly.

- [CraigMaslowski.erb](https://marketplace.visualstudio.com/items?itemName=CraigMaslowski.erb): Syntax highlighting for erb files

- [eamodio.gitlens](https://marketplace.visualstudio.com/items?itemName=CraigMaslowski.erb): Integrates several git features to vscode.

Install all the above-mentioned extension using the following command:

```bash
curl -s "https://raw.githubusercontent.com/bigbinary/wheel/main/.scripts/setup_vscode.sh" | ruby -
```

Here are some optional settings you can set to VS Code globally. You can press `Cmd + Shift + P` and input `>Preferences: Open User Settings (JSON)` to open `settings.json` file.

Add these lines in the file as settings:

```json
"editor.renderWhitespace": "all",
"files.trimTrailingWhitespace": true,
"files.trimFinalNewlines": true,
"editor.tabSize": 2,
"editor.bracketPairColorization.enabled": true,
"files.insertFinalNewline": true,
"terminal.integrated.scrollback": 1000000
```

## Spell checking in VSCode

If you are using VSCode to write blogs, articles, or generically any markdown
file, etc, then spell checking is very important. To get real time spell
checking on whatever you are editing and to provide automated corrections we use
the
[Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker&utm_source=pocket_mylist)
extension from VSCode which we have installed in the last section.

## Installing Prettier plugin

To make code more readable and consistent we can install the `Prettier` plugin.

This tool works well with Visual Studio Code such that code is automatically
formatted every time changes are saved.

### Installing the Prettier Visual Studio Code plugin

- Hit Cmd+Shift+P on Mac or Ctrl+Shift+P on Linux.
- Select "Extensions: Install Extensions".
- Search for `Prettier` plugin.
- Click "Install" and then reload VSCode after the installation.

#### Run Prettier every time a JavaScript file is saved

**This is also an optional step.**

- Hit Cmd+Shift+P on Mac or Ctrl+Shift+P on Linux.
- Type "Preferences: Open Workspace Settings".
- We will see two options.
- Select the option that has the word JSON.
- Paste the following content in the Settings file.

```json
{
  // rest of the keys as it was
  "folders": [],
  "settings": {},
  "[javascript]": {
    "editor.formatOnSave": true
  }
}
```

## Enable Rosetta in VSCode

We can check if Rosetta is enabled in our VSCode terminal by running the command
`arch` on our VSCode terminal. If it outputs `i386` we are good and can skip
this section.

If the output of `arch` is not `i386`, then we need to enable Rosetta in the
VSCode integrated terminal. We can add a terminal profile for Rosetta in VSCode,
as follows:

- Open VSCode
- Press `cmd+shift+p` to open the command palette.
- Search for `Open Settings`.
- Select `Open Settings (JSON)` and add the following lines towards the end of
  the JSON file:

```json
{
  //rest of the keys as it was
  "terminal.integrated.profiles.osx": {
    "rosetta": {
      "path": "arch",
      "args": ["-x86_64", "zsh", "-l"],
      "overrideName": true
    }
  },
  "terminal.integrated.defaultProfile.osx": "rosetta"
}
```

- Restart VSCode.

Now check if we configured it correctly. Type `arch` command and it should
return `i386`.
