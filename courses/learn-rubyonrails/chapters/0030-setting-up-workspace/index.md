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
plugins=(git ruby rails yarn bundler docker docker-compose brew macos z node)
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

The idea behind `z` is that it builds a list of your most frequent and recent —
"Frecent" — folders.

It allows you to jump to them quickly in one command, rather than having to tab
through a nested folder structure.

To install it, make sure `z` is included in the plugins list as mentioned in OMZ
plugins section.

While adding it in OMZ plugins section works for most, some users have trouble
getting it to work.

If that is the case, download `z` and put it in your home directory so that it’s
located at `~/z.sh`, like so:

```bash
curl -o "${HOME}/z.sh" "https://raw.githubusercontent.com/rupa/z/master/z.sh"
```

Then, in your `.zshrc` file, after listing the plugins, include the following
and then restart your terminal:

```bash
. ~/z.sh
```

It's time for what you’ve been waiting for. Time to jump around!

If you type just `z` in your terminal, it should now show you the locations
you’ve visited, along with the `Frecency` score.

But let's say that you're using a new laptop/terminal where you haven't
traversed to many folders yet. Then there won't be any "frecency" score that `z`
can show.

Let's do an example to understand how `z` comes in handy.

Run the following from your terminal:

```bash
cd ~/.oh-my-zsh/plugins
```

Now the current directory in your terminal should be `plugins`.

You can verify your current working directory by running the following command:

```bash
pwd
```

Let's say that everyday as part of your work you need to change pwd into this
`plugins` directory.

So rather than running the `cd ~/.oh-my-zsh/plugins` command each time, you
could run the following:

```bash
z plug
```

Now your `pwd` should be `~/.oh-my-zsh/plugins` folder.

Using `z` we have used one substring part of the path where we wanted to
traverse and we've reached that folder.

In a daily work environment this comes in super handy!

Note that you may not be able to run the following commands given that your `cd`
history and folders specified may not exist.

As an example, based on my jumping history, I can do the following.

```bash
# Takes me to /var/www/mysite/wp-content/themes
z themes

# Takes me to /var/www/staging/wp-content/themes
z staging themes

# Takes me to /var/www/mysite/wp-content/plugins
z plu

# Lists all the paths including "themes" in them.
z themes -l
```

## Installing ripgrep

You can search a keyword/sentence within a directory or file and `ripgrep` will
give your the results almost instantly.

`ripgrep` is really fast when compared to other searching tools like `find`.

Let's install it:

```bash
brew install ripgrep
```

Great! Now goto any project and search for any keyword like so:

```bash
rg "keyword"
```

## Installing Vim

At one point of your development life, you will rely on `vim` to get the job
done.

There will be valid cases like say SSH'ing into a server, where `vim` can be
your knight in shining armor.

Install vim, like so:

```bash
brew install vim
```

## Installing Docker

Docker Engine still hasn't ported a build that natively supports M1 Chips.

Thus the best way to use Docker will be using Docker Desktop.

It will provide us with `docker` as well as `docker-compose`.

You can install Docker Desktop for M1 by downloading the application from the
[official website](https://docs.docker.com/docker-for-mac/apple-silicon/).

Once installed `docker` and `docker-compose` should be working.

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

Currently, we use Node.js `v16.5` in our `wheel` project. You can install the
same version by running the following:

```bash
nvm install 16.5
nvm alias default 16.5
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
