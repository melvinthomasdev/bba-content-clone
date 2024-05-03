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
