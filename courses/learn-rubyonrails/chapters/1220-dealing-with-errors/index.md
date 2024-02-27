In this chapter, we will take a look at some common errors that occur during
Rails development and how to fix these errors

## rbenv path not added

If the `rbenv` path is not added in the `.zshrc` config file then the following
error can appear:

```bash
WARNING: You don’t have /Users/id/.gem/ruby/2.6.0/bin in your PATH,
	 gem executables will not run.
Successfully installed rails-7.0.5
```

To fix this, verify that `rbenv` path is added in the `.zshrc` using the
following command:

```bash
code ~/.zshrc
```

The above command will open the `.zshrc` file. In this file check for the
`rbenv` path. If the path is not found then add the following lines to the
config file and save it:

```bash
# path to rbenv installation
export PATH="$HOME/.rbenv/bin:$PATH"
# initialize rbenv on startup
eval "$(rbenv init -)"
```

## Ruby installation missing psych error

Ruby needs `libyaml` library to parse and emit YAML. If this library is not
present on the system, one may encounter a missing psych error while installing
Ruby.

```bash
warning: It seems your ruby installation is missing psych (for YAML output).
To eliminate this warning, please install libyaml and reinstall your ruby.
uh-oh! RDoc had a problem:
cannot load such file -- psych
```

To fix this error, install `libyaml` using Homebrew by running the following
command:

```bash
brew install libyaml
```

Once the installation of the library is complete, restart the terminal and
install the appropriate version of Ruby using `rbenv`.

```bash
rbenv install 3.x.x
```

You should now be able to install Ruby without any issues.

If the above steps do not solve the issue, you may need to link `libyaml`
manually by running the following command after the installation of the library:

```bash
brew link libyaml
```

Note that this step should only be performed if the previous steps have failed
to resolve the issue.

## Shakapacker compatibility issue

There can be compatibility issues with some versions of `shakapacker`. Please read
the
[webpacker module and version issues section](/learn-rubyonrails/webpacker-in-depth#Webpacker-module-and-version-issues)
for more info.

Take a look at the
[setting up Shakapacker chapter](/learn-rubyonrails/setting-up-shakapacker)
in this book for steps to fix the shakapacker compatibility issues.

## rails command does not exist

Sometimes the following error can occur on running a command like
`bundle exec rails server`:

```bash
The rails command exists in these Ruby versions:
  3.0.xx
```

This error can occur if the `rails` gem is installed in a different Ruby version
than the one being used globally. To fix this you should first set the desired
Ruby version as the global version and then install the `rails` gem in that
version.

For example, to set the global ruby version to `3.2.2`, run the following
command:

```bash
rbenv global 3.2.2
gem install rails
```

Make sure that the required Ruby version is installed in the system. You can
check which versions are installed using the following command:

```bash
rbenv versions
```

To install another Ruby version, you should first update the `ruby-build` to get
an updated list of all the available versions. Run the following command to do
so:

```bash
brew upgrade ruby-build
```

Now check the available versions using the following command:

```bash
rbenv install --list
```

## Ruby and Apple Silicon

If you are using Apple silicon, then you can run into issues while installing a
Ruby version because your computer could have two different brew installations.
One for arm architecture under the `/opt/homebrew` directory and another one for
the Intel architecture(using Rosetta) under the `usr/local` directory.

To avoid such issues remove the arm version and make sure the terminal is using
Rosetta. Please refer to
[this](/learn-rubyonrails/setting-up-mac#uninstall-arm64-brew) section for
steps to remove the arm brew and then refer to
[enabling Rosetta on Mac section](/learn-rubyonrails/setting-up-mac#enable-rosetta-for-terminal-on-m1-mac)
for steps to install `homebrew` under Rosetta.

## Fixing failing ruby-build

You can get the following error if your `ruby-build` is failing during an
operation:

```bash
BUILD FAILED (macOS 11.6.1 using ruby-build 20211019)

Inspect or clean up the working tree at /var/folders/ck/wxjp95sj2d90dd1ls1zsnf8c0000gn/T/ruby-build.20211102122424.5245.ifbDiJ
Results logged to /var/folders/ck/wxjp95sj2d90dd1ls1zsnf8c0000gn/T/ruby-build.20211102122424.5245.log

Last 10 log lines:
The Ruby yaml extension was not compiled.
ERROR: Ruby install aborted due to missing extensions
```

To fix this issue, remove the command line tools and reinstall `xcode` using the
following command:

```bash
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
```

Then install the necessary packages:

```bash
brew install rbenv ruby-build openssl readline libyaml zlib
```

## No response from PostgreSQL service

Using an arm terminal to start the `PostgreSQL` service when it is installed in
the Intel compiled brew can lead to an error. You can verify the error by
running the following command:

```bash
brew services list
```

The issue can be resolved by stopping the service from the arm terminal and
quitting the terminal and starting the service from the Rosetta terminal.

You can start or stop a service using the following commands:

```bash
# start a service
brew start service_name
# stop a service
brew stop service_name
```

## Sass syntax error in production

If the assets aren't pre-compiled in production then adding `tailwind` imports
to your `application.css` file can throw the following error:

```bash
SassC::SyntaxError: Error: File to import not found or unreadable: tailwindcss/base.
        on line 17:2 of stdin
     >>  @import "tailwindcss/base";
```

This can happen, if `tailwindcss` is listed as a `devDependency` in your
`package.json` file. To fix this move `tailwindcss` to the `dependencies`
section of `package.json`.

## PostgreSQL disallowing indexing on large fields

If the field being indexed in PostgreSQL exceeds the buffer page size, it can
result in the following error being thrown:

```bash
ActiveRecord::StatementInvalid: PG::ProgramLimitExceeded: ERROR:  index row requires 493024 bytes, maximum size is 8191
```

Indexing on columns that stores large data is not a good practice since it can
be highly inefficient. Hence the simplest solution is to remove such indexes
altogether.

If it is indispensable, as a workaround, you can create a hash of the oversized
field and index the hash instead of the actual field.

## Miscellaneous errors

- Often developers miss out on restarting the server after making changes to the
  Rails config files or application secrets files. These files are only loaded
  once when the server is started hence it is a good practice to restart the
  server after making a change to such files to avoid any errors.

- Avoid syntax errors. For example missing out on colons or not ending a block
  can lead to syntax errors. These are hard to catch. Best way to check the line
  number in the stacktrace and look at the codebase.
