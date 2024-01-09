## Enable Rosetta for Terminal on M1 Mac

If `Rosetta 2` is not installed by default in your M1 Mac, then open the
pre-installed `Terminal` app and run the following command:

```bash
/usr/sbin/softwareupdate --install-rosetta --agree-to-license
```

Rosetta allows us to use apps built for Mac with intel chip.

Several CLI tools do not have native versions built for the new M1 architecture.

Enabling them on your native M1 Mac terminal can be frustrating.

Follow these steps to enable Rosetta:

- Select the app(Terminal) in the Finder. Note that the "Terminal app" could be
  at "Applications/Utilities".

- Right click on the app(Terminal) and select `Get Info`.

- In `General`, check the `Open using Rosetta` check-box.

- Close the Terminal Info.

- Now when you quit the terminal and open it again.

- If you haven't installed Rosetta yet, then it would prompt you to install it.

- If the popup shows up, then click on `Install` button, then enter your user
  name and password to allow installation to proceed.

- Close the Terminal and open again.

- Now we have a special terminal that can install tools with Rosetta
  translation.

To verify that you are using a Rosetta terminal, run the following command and
it should output `i386`:

```bash
arch
```

The native terminal without Rosetta would output `arm64` for the above command.
If you still do not see `i386` in the terminal then please restart the laptop.

**Moving forward, all commands we ask you to execute should be done in Rosetta
enabled terminal.**

## Install Xcode command line tools

Check the version of your operating system. If your version number is 10.9 or
higher, follow the next step. If your OS X version is less than 10.9, you should
consider upgrading your operating system to 10.9 or higher. It's completely
free.

In this book, we will not be installing Xcode. Hence no need to download Xcode
from App Store. In this section, we will be installing Xcode command line
developer tools.

We can install Xcode command line developer tools like this:

```bash
xcode-select --install
```

## Uninstall arm64 brew

If you have installed brew in the past from the native terminal, it is likely
that you have an arm64 build of brew. Having two different builds of brew can
cause major problems as the packages with different builds will not be
compatible with each other.

To avoid this problem you need to uninstall your current installation of arm64
brew.

You can check which build you have by running the following command:

```bash
which brew
```

If your installation of brew is the Intel build, then the command should output
`/usr/local/bin/brew`. If that is the case you can skip installing brew and just
update your current installation by running `brew update`.

If your output is `/opt/homebrew` then your installation of brew is the arm64
build.

You need to uninstall the arm64 build of brew by running the following command
from the native terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"
```

## Install Intel brew

Install [Homebrew](https://brew.sh), which is the package manager:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Once done, run the below command to ensure that we make use of the `HEAD`
revision:

```bash
git -C $(brew --repository homebrew/core) checkout main
```

Now verify the installation of the `brew` command:

```bash
which brew
```

The command should output `/usr/local/bin/brew`, which is the expected path.

## Ensure ZSH is the default shell

Before going forward, please make sure `zsh` is your default terminal shell. To
check that execute the following command.

```bash
echo $SHELL
```

If the output is not "/bin/zsh" then `zsh` is not your default shell.

Execute the following command to set `zsh` shell as default shell manually:

```bash
chsh -s $(which zsh)
```
