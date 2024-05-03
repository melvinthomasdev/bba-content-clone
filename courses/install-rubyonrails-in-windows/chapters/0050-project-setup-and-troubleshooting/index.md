## Cloning the repository and setting it up

Now we have all the pieces of the puzzle ready. We just have to put them together. Let's start by cloning our repository. For this let's create a new working directory within WSL where we want our project files to be in.

IMPORTANT NOTE: Try to avoid cloning and working on files in the Windows directories from WSL i.e. do not work on files in the directory `/mnt/*`. This is because WSL acts as a subsystem in Windows with its own file system. All the windows directories are considered to be external storage in WSL and working with them tends to be extremely slow since a connection has to be established between the two systems to access the files. When developing on WSL, always work on directories which are outside `/mnt`.

Let's create a directory in `home` to clone our repository. For this, use the command:

```bash
cd ~
mkdir path/to/your/directory
cd path/to/your/directory

# Eg.
# cd ~
# mkdir BigBinary/projects
# cd BigBinary/projects
```

Let's clone our repository here now.

IMPORTANT NOTE: If you have cloned the repository using some git client in Windows please delete it and start fresh as mentioned in the steps above. This is because Windows and Unix machines treat line ending differently and cloning a repository in Windows using git converts the line endings to the Windows format by default unless explicitly specified. This can cause a lot of undesired outputs and errors.

To clone the project use the command:

```bash
git clone https://github.com/VarunSriram99/granite-playwright
```

Now that we have cloned our project, lets go inside it by using the cd command:

```bash
cd granite-playwright
```

To confirm that we have cloned the repository successfully and that we in the right place, use the following commands:

```bash
ls
pwd
```

We should get an output similar to this:

<image alt="Confirm clone success">confirm-clone-success.png</image>

IMPORTANT STEP: Let's change the access permissions of the files in the cloned repository. Skipping this step will result in a lot of permission issues when you start working with the project. So it is vital that you do this step. To grant all access permissions to the files in this directory, use the command:

```bash
chmod -R 777 .
```

There won't be any output for this command if all goes well. Now we can open our repository in VSCode. To do this you can enter the command:

```bash
code .
```

If this doesn't work, then open VSCode and open the directory using the `Ctrl + O` shortcut key. Make sure you are connected to WSL in VSCode before you do this step. You should be able to see a screen similar to this:

<image alt="VSCode open granite playwright">
  vscode-open-granite-playwright.png
</image>

Note that all the files will be marked as modified in git. This is because we changed the access permissions for all of them.

Now that this is done, let's setup our application. To do this, let's navigate to the repository from our WSL terminal and enter the following command:

```bash
./bin/setup
```

This one command will download all the ruby gems, the npm packages, initialize the database and seed the data. If all goes well the command should exit with a message ending with these lines:

```
Seeding with sample data...
Truncating all the records from the database
Seeding the database with sample data
Creating users
Creating tasks for users
1. Creating tasks for admin
2. Creating tasks for customers
Creating comments for each of the tasks
Done! Now you can login with either "oliver@example.com" or "sam@example.com", using password "welcome"
sample data has been added.

== Removing old logs and tempfiles ==

== Restarting application server ==
```

If some error was thrown during this step, some basic troubleshooting steps include:

1. Making sure PostgreSQL has been started and is running. If it was started previously, then there is a chance that it might have stopped when you closed the WSL terminal. So open a new tab and execute `sudo service postgresql start`.
2. Making sure Redis has been started and is running. If it was started previously, then there is a chance that it might have stopped when you closed the WSL terminal. So open a new tab and execute `sudo service redis-server start`.
3. Making sure the right versions of Ruby, Rails and Node.Js have been installed.

If you have all the above working fine then follow the FAQ section below to see if the problem you're facing is listed below and try resolving it based on the solutions provided.

Now that we have setup the application, we can start working with it.

## Starting the servers

To start the Rails server, open a new terminal window, navigate to the repository and type the following command:

```bash
bundle exec rails server
```

IMPORTANT NOTE: The PostgreSQL and Redis servers should be up and running in other tabs/windows of the WSL terminal. They should not be closed until you stop working with the application.

Executing the above command will give an output similar to this:

```
=> Booting Puma
=> Rails 7.0.5 application starting in development
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Version 4.3.12 (ruby 3.2.2-p53), codename: Mysterious Traveller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://127.0.0.1:3000
* Listening on tcp://[::1]:3000
Use Ctrl-C to stop
```

Now we need to start the webpack-dev-server. To do this, create a new terminal window, navigate to the repository and enter the following command:

```
./bin/webpacker-dev-server
```

If it works well, then we should get a similar output:

<image alt="Webpacker dev server windows">webpack-dev-server-windows.png</image>

Great! Now that we have all the servers up and running, we can open the app. To do this, open a browser and go to the URL, [http://localhost:3000](http://localhost:3000). We should be able to see a similar page:

<image alt="Localhost granite">localhost-granite.png</image>

We have successfully installed Rails and React and should be able to move forward with the rest of the book.

## FAQ and Debugging most commonly faced problems

We have documented most of the issues faced when installing Rails in Windows in this
[KB document](https://s-varun.neetokb.com/public/p-7917eaf00e).
Please refer this document to see if it solves the issues you're facing.
