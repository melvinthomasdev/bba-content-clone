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

## Installing Oh My ZSH

Oh My Zsh(OMZ) is a delightful, open source, community-driven framework for
managing your Zsh configuration.

It comes bundled with thousands of helpful functions, helpers, plugins, themes,
and other goodies that will make you say `Oh My ...!`.

Install OMZ:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Now restart your terminal.

### Add OMZ plugins

To add a new plugin, type the names shown in parentheses below to `plugins` key,
making sure to include a space between each name.

Add the following at the top of your `.zshrc`:

```sh
plugins=(git ruby rails yarn bundler brew macos z node)
```

Restart the terminal for zsh to auto install all the specified plugins.

If you ever feel that your `SHELL` is slow in starting, then removing few of
these plugins is a good step.

## Install fonts

Now if you restart your terminal, zsh will auto install all the plugins.

But most probably your shell prompt would be looking very ugly.

The issue is that we don't have a good font which contains all the glyphs that
are part of our prompt.

Thus let's install powerline fonts:

```bash
git clone https://github.com/powerline/fonts.git --depth=1
# install the fonts
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

Now let's setup the terminal font.

Open `Terminal` app, and do the following:

- Open `Terminal > Preferences > Profiles > Text > Change Font`.
- Set it to something that has "for Powerline" in its name.
- Use `Meslo LG DZ for Powerline` font.

Now restart your terminal and you should be seeing a beautiful prompt!

## Installing z for jumping around

z allows you to jump to folders quickly in one command, rather than having to tab
through a nested folder structure.

In the plugins section we included `z`. That should work for most of people. First
let's see if that works for you or not. Open terminal and just type `z`. If you don't see
`command not found` then you are all set. You can skip to the last part of this section where
we have mentioned a YouTube video for to watch to learn how to use `z` effectively.

To install `z` execute the following command.

```bash
curl -o "${HOME}/z.sh" "https://raw.githubusercontent.com/rupa/z/master/z.sh"
```

Open `~/.zshrc` file and include the following line at the very bottom and then restart your terminal:

```bash
. ~/z.sh
```

Now open a new terminal and type `z` on the command line. You should see some output.

Watch [this YouTube video](https://www.youtube.com/watch?v=qbNn5zJLZU0) to learn how to use command `z`.

## Installing ripgrep

You can search a keyword/sentence within a directory or file and `ripgrep` will
give your the results almost instantly.

`ripgrep` is really fast when compared to other searching tools like `find`.

Let's install it:

```bash
brew install ripgrep
```

Great! Now goto any project and search for any keyword like this:

```bash
rg "keyword"
```

## Installing Vim

At one point of your development life, you will rely on `vim` to get the job
done.

There will be valid cases like say SSH'ing into a server, where `vim` can be
your knight in shining armor.

Install vim, like this:

```bash
brew install vim
```

## Installing Node.js

Different applications use different versions of Node.js.

Thus it is useful to be able to switch between different versions of Node.js on
the fly.

At BigBinary we use [Node Version Manager (nvm)](https://github.com/nvm-sh/nvm),
which helps us maintain the correct Node.js version specific to a project, and
switch between them without much hassle.

### Installing nvm

Running the below command on your terminal will install nvm locally:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

### Installing a Node.js version using nvm

Currently, we use Node.js `v18.12` in our `wheel` project. You can install the
same version by running the following:

```bash
nvm install 18.12
nvm alias default 18.12
```

If you're not a fan of `nvm`, then [n](https://github.com/tj/n) is a good
alternative.

## Installing Yarn

You shouldn't use `npm` command in BigBinary projects.

We make use of `yarn` to manage JavaScript libraries and tool chains.

Install it:

```bash
brew install yarn
```
