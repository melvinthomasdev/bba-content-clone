## Installing system packages

IMPORTANT NOTE: From here on we will be executing all the commands in the WSL shell and not the Windows shells like Powershell or CMD. The WSL shell is the Ubuntu terminal in our case.

To get started with Ruby on Rails, first we need to install all the dependent system packages on the WSL. For this execute the following command within the WSL shell:

```bash
sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
```

## Installing zsh

We will be using ZSH as our default shell. To install and set ZSH as our default shell, follow these steps:

```bash
sudo apt install zsh -y
```

After the installation is complete, we need to configure zsh in our system. For the time being we will use the default configuration and build upon that. To do this execute this command on the shell:

```bash
zsh
```

You will be greeted with this message:

```
This is the Z Shell configuration function for new users,
zsh-newuser-install.
You are seeing this message because you have no zsh startup files
(the files .zshenv, .zprofile, .zshrc, .zlogin in the directory
~).  This function can help you with a few settings that should
make your use of the shell easier.

You can:

(q) Quit and do nothing. The function will be run again next time.

(0) Exit, creating the file ~/.zshrc containing just a comment.
That will prevent this function being run again.

(1) Continue to the main menu.

(2) Populate your ~/.zshrc with the configuration recommended
by the system administrator and exit (you will need to edit
the file by hand, if so desired).

--- Type one of the keys in parentheses ---
```

Here select option `2` which will create a `.zshrc` file in your home directory with the default configuration. This would be a good time to restart our terminal so that all the new changes are in effect properly.

Now that we have installed ZSH, we need to configure ZSH to be our default shell. To do this execute the following command in a new WSL shell:

```bash
chsh -s $(which zsh)
```

Now quit and reopen your WSL terminal. You should see the ZSH shell now. But just to confirm that zsh is now you default shell, execute:

```bash
echo $SHELL
```

If you get the result `/user/bin/zsh` as your response, then that means, you have successfully installed and set ZSH as your default shell.

## Setting up Oh my ZSH(OMZ) [Optional]

Oh My Zsh(OMZ) is a delightful, open source, community-driven framework for managing your Zsh configuration.

It comes bundled with thousands of helpful functions, helpers, plugins, themes, and other goodies that will make you say Oh My ...!.

To install OMZ do the following steps:

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Once completed, you should get a similar output:

<image alt="Oh my zsh install">oh-my-zsh-install.png</image>

Now lets add the OMZ plugins that will be useful to us in the `.zshrc` file. To do this, you can make use of your desired text editor like VSCode or Vi. Use the following commands to edit the text file:

```bash
# Open using VSCode
code ~/.zshrc

# OR

#Open using Vi
vi ~/.zshrc
```

Now add this line to the top of your `.zshrc` file:

```
plugins=(git ruby rails yarn bundler docker docker-compose z node)
```

Your file should look something like this:

<image alt="Zshrc plugins">zshrc-plugins.png</image>

Once completed, save the file and restart your shell by using this command:

```bash
source ~/.zshrc
```

Doing this will auto-install all the specified plugins.
