## Running Rails server

In the previous chapter we had set up a basic Rails server. There we ran the
Rails server from the terminal using the `bundle exec rails server -p 3000`
command.

We can also use an alias, that is `s` for `server`, in the above mentioned
command to run a Rails server in the shortened format, like so:

```bash
bundle exec rails s -p 3000
```

The `p` flag is used to specify the `PORT` number on which the server will run.
In this case the PORT number is 3000.

Merely running the Rails server for an application which also uses Webpack to
compile JavaScript assets and related files can cause performance issues and
slow down the overall development process.

Thus we should compile Webpack related files separately.

## Using Webpack development server

We will run the `rails server` command in one terminal and the
`webpacker-dev-server` command in another terminal.

Open a new terminal tab or window. In the "Terminal" app in macOS you can do so
using `command + T` keys for a new tab and `command + N` keys for a new terminal
window.

Once a new terminal is open, run the following command:

```bash
./bin/webpacker-dev-server
```

`webpacker-dev-server` is an executable file which resides inside the `bin`
folder. Running the above command will start the Webpack development server and
Webpacker will automatically proxy all Webpack asset requests to this server.

## Running the application

So to summarize, whenever testing out a Rails application in development
environment, open the Rails server in one terminal and `webpacker-dev-server` in
another. Thus when stopping the application, you will have to exit from both
these terminals.

If you're still not convinced on the advantages of using `webpacker-dev-server`,
then give the last two
[in-depth sections](/learn-rubyonrails/webpacker-in-depth#downside-of-not-running-webpack-development-server-during-development)
within the book a read and come back. Those sections might be pretty
complicated. That's why it's towards the end of the book. There's no issue if
you don't read it now.

**There is nothing to be committed in this chapter.**
