## Installing Node.JS

Different applications use different versions of Node.js.

Thus it is useful to be able to switch between different versions of Node.js on the fly.

At BigBinary we use Node Version Manager (nvm), which helps us maintain the correct Node.js version specific to a project, and switch between them without much hassle.

To install nvm, use the following command:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

After successfully completing this step close and reopen your WSL terminal. Now let's install the proper versions of Node.JS. At BigBinary, we use node version 18.12 for our projects. So to install the proper version, use the following commands:

```bash
nvm install 18.12
nvm alias default 18.12
```

This will install node version 18.12.1 and set it as your default node version.

In BigBinary we use yarn as our go to package manager. So let's install yarn using this statement:

```bash
npm install --global yarn
```

To confirm yarn installation you can check the yarn version by executing this command:

```bash
yarn -v
```

This should return a value similar of the format `1.22.22` if the installation was successful. Your yarn version might vary from the one listed here. The version of yarn doesn't matter. The only thing you have to verify is that executing the command stated above returns some version.

## Install rbenv

We will be using [rbenv](https://github.com/rbenv/rbenv) as our Ruby version manager. To install, follow these steps:

```bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
```

Now lets add the rbenv paths to out `.zshrc` file. For this execute the following command:

```bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
```

Let's reload zsh by executing the following command:

```bash
source ~/.zshrc
```

Let's integrate rbenv with zsh

```bash
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
```

If all goes well, you will not see any output for this command.

## Installing Ruby

Before we install Ruby, we need to make sure that build essentials is installed properly. To install build essentials, use the command:

```bash
sudo apt-get install build-essential libz-dev libffi-dev libssl-dev libtool libreadline-dev libyaml-dev
```

We will be installing ruby version 3.2.2. For this execute the following command:

```bash
rbenv install 3.2.2
rbenv rehash
```

Now let's set the default version of ruby as 3.2.2. For this execute:

```bash
rbenv global 3.2.2
```

Great! You can confirm whether you have installed the right version of Ruby by executing the following command:

```bash
ruby -v
```

This should return an output similar to this:

```
ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]
```

If you're not able to get this output, try reloading zsh by executing the command `source ~/.zshrc` and try again. If it still throws an error, then something went wrong during your installation process and will have to start from the rbenv installation again.

## Installing Rails

Now that we have Ruby up and running, its time to install Rails. For this, we will be using the gem command. Note that for this exercise, we will be installing Rails version 7.0.5. Execute this command:

```bash
gem install rails --no-document -v 7.0.5
```

Flag --no-document disables document generation.

Now install bundler which help us manage Ruby gems:

```bash
gem install bundler
```

Now that we have Ruby on Rails installed, we need to install PostgreSQL as well as redis for our application to work properly.

## Installing PostgreSQL

To install PostgreSQL you have to execute the following command.

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib libpq-dev
```

Now you can start the PostgreSQL service by entering the following command:

```bash
sudo service postgresql start
```

This should give you an output similar to

```
Starting PostgreSQL 12 database server [ OK ]
```

Now that we have PostgreSQL up and running, lets create a new role in it so that our apps can access it. For this execute the command:

```bash
sudo -u postgres createuser --interactive --pwprompt
```

Here you should be getting a prompt asking for the details of the new role. Enter the details as follows:

```bash
Enter name of role to add: <your_unix_user_name>
Enter password for new role: <leave_as_empty>
Enter it again: <leave_as_empty>
Shall the new role be a superuser? (y/n) y
NOTICE:  empty string is not a valid password, clearing password
```

Your output will look similar to this:

<image alt="Postgres create user">postgres-create-user.png</image>

IMPORTANT NOTE: It is crucial that you leave the password empty.

To confirm that the new user has been created you can enter the psql console. For doing that enter the command:

```bash
psql postgres
```

You should see the PSQL console now. Here you can type the command `\du` to list the available roles. The role you just created should be visible on the table.

<image alt="Roles list postgres">roles-list-postgres.png</image>

You should be able to see an output similar to the one above. You can exit from the psql terminal by entering `\q`.

## Installing Redis

Let's install Redis now. To install, execute the following commands in a WSL shell:

```bash
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

sudo apt-get update
sudo apt-get install redis
```

This will install redis on your machine. Now quit and reopen your WSL shell. We try starting the redis server. For this, execute the command:

```bash
sudo service redis-server start
```

This should start the redis server. To confirm execute:

```bash
sudo service redis-server status
```

You should see a message similar to this:

```
 * redis-server is running
```

If this throws an error or fails, then something went wrong with the redis installation. Try and install redis from start again following all the steps carefully.
