Before moving ahead with this section make sure that you are using the Intel
build of brew. For that, you can to refer to
[Uninstall arm64 brew](/learn-rubyonrails/setting-up-macos#uninstall-arm64-brew)
section of the book. Also make sure you had installed Xcode command line tools
as we had mentioned in previous chapter.

## Install system packages

Ruby needs certain system packages like Openssl for it to be compiled properly.
Thus install the following packages from the Rosetta enabled terminal:

```sh
brew install ruby-build openssl readline libyaml zlib
```

## Install rbenv

Install [rbenv](https://github.com/rbenv/rbenv). Using rbenv we can install a
specific version of Ruby:

```bash
brew update
brew install rbenv
```

If you don't know which shell you are using then
[refer to this answer](https://unix.stackexchange.com/questions/96305/which-shell-am-i-running-on).

If you are using zsh shell then use the following command:

```bash
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
```

If you are using bash shell then execute the following command:

```bash
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
```

Now restart the terminal and run the following:

```bash
rbenv install 3.2.2
rbenv rehash
```

Add `~/.rbenv/bin` to your `$PATH` for accessing the `rbenv` command-line
utility.

If you are using bash shell then execute the following command:

```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
```

If you are using zsh shell then use the following command:

```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
```

Restart the terminal and `rbenv` should be available as a command.

It's often seen that folks have a Ruby version conflicts in their system. It's
mostly because Ruby gets installed by default on the system level. But
system-level `ruby` command has different permissions and paths, compared to the
`ruby` command installed via `rbenv`.

Thus let's set the global version of the `ruby` command to be a `rbenv` specific
version, like this:

```bash
rbenv global 3.2.2
```

Now that we have set the global Ruby version to be an `rbenv` specific version,
let's verify the same, by running the following commands:

```bash
rbenv version # version should be 3.2.2
ruby -v # version should be 3.2.2
```

In M1 Mac, we need to install the shared mime info, if it doesn't already exist:

```bash
brew install shared-mime-info
```

## Installing Ruby on Rails on macOS

Now install Ruby on Rails gem:

```bash
gem install rails --no-document -v 7.0.5
```

Flag `--no-document` disables document generation.

Now install bundler which help us manage Ruby gems:

```bash
gem install bundler
```

## Installing Ruby on Rails in other operating systems

At [BigBinary](https://bigbinary.com) we use Mac.

Thus, we won't be documenting on how to install Ruby and Ruby on Rails on
Windows/Linux.

There are plenty of good materials on the internet and on YouTube about
installing Ruby on Rails and setting up the work environment on Windows/Linux.

## TypeError for Rails project in M1 Mac

If you ever receive the `TypeError: Unable to resolve type 'size_t'` error while
working on a Rails project in M1 Mac, then run the following command to fix it:

```bash
bundle update ffi sassc
```

## Rbenv Ruby build definitions not found error

`Rbenv Ruby build definitions not found` error is thrown if `ruby-build` is not
installed. `ruby-build` is an `rbenv` plugin that provides the `rbenv install`
command to compile and install different versions of Ruby on UNIX-like systems.

You can check if `ruby-build` is installed system-wide under homebrew using
`which` command like this:

```bash
which ruby-build
```

If `ruby-build` already installed, then the following installed path should show
up in the terminal:

```bash
/usr/local/bin/ruby-build
```

Otherwise you will receive the following error:

```bash
ruby-build not found.
```

If `ruby-build` is not installed, then you should install it like this:

```bash
brew install ruby-build
```
