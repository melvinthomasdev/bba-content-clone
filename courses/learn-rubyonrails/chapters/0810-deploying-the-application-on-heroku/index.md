Once you finish this chapter, you will get an idea of all the steps that we need
to take to deploy to Heroku.

But to make your application work in Heroku, you would have to complete the
upcoming chapter
["Configure Sidekiq in Heroku"](https://www.bigbinary.com/learn-rubyonrails-book/sidekiq-in-heroku)
and execute the steps mentioned there to make our Sidekiq workers run as
intended.

## PostgreSQL database setup

We at BigBinary use [PostgreSQL](https://www.postgresql.org/) database on
Heroku.

When our application is deployed to Heroku, it will be running in `production`
mode.

We can install PostgreSQL by using Homebrew(preferred) or by using
`Postgres.app`. Go through the next sections to understand how to install and
use PostgreSQL.

### Install PostgreSQL using Homebrew

```bash
brew install postgresql
```

The `config/database.yml` file should look like this:

```yaml
<% branch_name = `git symbolic-ref HEAD 2>/dev/null`.chomp.sub('refs/heads/', '') %>
<% repository_name = `git rev-parse --show-toplevel`.split('/').last.strip %>

default: &default
  adapter: postgresql
  encoding: unicode
  host: <%= ENV['PG_HOST'] %>
  pool: 5
  username: <%= ENV['PG_USER'] %>
  password: <%= ENV['PG_PASSWORD'] %>

development:
  <<: *default
  database: <%= "#{repository_name}_development" %>

test:
  <<: *default
  database: <%= "#{repository_name}_test" %>

heroku:
  <<: *default
  database: <%= "#{repository_name}_heroku" %>

staging:
  <<: *default
  database: <%= "#{repository_name}_staging" %>

production:
  <<: *default
  database: <%= "#{repository_name}_production" %>
```

The env variables in the config will be populated during runtime. If you prefer
to hardcode the values for `PG_USER` etc, then you can do that. The
`config/database.yml` should be ignored via `.gitignore`. It should never be
committed to your Git tree.

After installing PostgreSQL, you can check the version you are running by
executing:

```bash
postgres -V
```

Once the installation is complete we need to start PostgreSQL service to use
postgresql in our project:

```bash
brew services start postgresql
```

You can check if the PostgreSQL is working properly and accepting responses by
running the following command:

```bash
pg_isready
```

This should return an output similar to:

```bash
/tmp:5432 - accepting connections
```

Sometimes the above mentioned `postgres` installation method leads to a
`Library not loaded` error like this:

<image>postgres-lib-not-loaded-error.png</image>

The issue is that even after using command the `brew install postgres`, brew
might install a specific version like version 14. Then all the `postgres`
related libraries will be tracked under a directory named as `postgres@14`. But
when the `pg` gem is installed without passing in any config, it will always
look for the folder named as `postgres` without any versioning. And this
difference in folder name results in the `Library not loaded` error.

To fix this issue reinstall the `postgres` with the version, like so:

```bash
brew reinstall postgresql@14
```

This will inform the `pg` gem to look for `postgres@14` directory and the
`postgres` library will be loaded successfully.

### Handle services using brew

In macOS, services are the files ending with the `.plist` file extension. Let's
see what all services your mac has. Go to `~/Library/LaunchAgents` or
`/Library/LaunchAgents` and look for the files ending with `.plist`. All those
`.plist` files are the services installed on your mac.

`launchctl` is a tool used for managing services in macOS. `launchctl` loads and
unloads services that will start automatically at login.

We can load the services at the time of login with `launchctl` like so:

```bash
launchctl load $PATH_TO_LIST
```

We can also unload the services, like so:

```bash
launchctl unload $PATH_TO_LIST
```

So to run a service we need the `.plist` file location and the `launchctl`
commands to run it. But it's not possible to remember `.plist` file location.
Also, `launchctl` commands are complex and hard to remember. We can deal with
services without the knowledge of `.plist` file locations and the `launchctl`
commands using Homebrew. Homebrew provides an interface to handle services with
ease.

We can start a `postgresql` service with Homebrew, like so:

```bash
brew services start postgresql
```

The above mentioned command runs the postgresql's `.plist` file using the
`launchctl`.

If the system has multiple versions of `postgresql`, then we will have to
specify the version like so:

```bash
brew services start postgresql@14
```

We can check all the versions installed for `postgresql`, like so:

```bash
brew list --versions postgresql
```

We can restart the service, like so:

```bash
brew services restart postgresql@14
```

We can check all the currently loaded services like so:

```bash
brew services list
```

For more Homebrew commands refer
[this cheat sheet](https://devhints.io/homebrew) from `devhints.io`.

### Install PostgreSQL using Postgres app

If you are using a macOS and if you are not able to setup PostgreSQL via
Homebrew as mentioned in the above section, then
[Postgres.app](http://postgresapp.com) is another option.

The `config/database.yml` file for the `Postgres.app` should be like so:

```yaml
<% branch_name = `git symbolic-ref HEAD 2>/dev/null`.chomp.sub('refs/heads/', '') %>
<% repository_name = `git rev-parse --show-toplevel`.split('/').last.strip %>

# Check https://gist.github.com/neerajdotname/b9d53f8a234da9d8c007de5e3d98bc21 to see
# details about the restriction on database name

# If you prefer to have branch name in the database name then use following
# database: <%= "#{repository_name}_development_#{branch_name}"[0...63] %>

development:
  adapter: postgresql
  database: <%= "#{repository_name}_development"[0...63] %>
  host: localhost
  pool: 5

test:
  adapter: postgresql
  database: <%= "#{repository_name}_test"[0...63] %>
  host: localhost
  pool: 5
```

Please note that the `config/database.yml` file to be added after `brew install`
will be defined in the upcoming chapters and it is different from the one
defined for the `Postgres.app` installation.

Given that currently, we are using PostgreSQL only in the production
environment, we don't need to make any modifications to the
`config/database.yml` file. The `config/database.yml` file is anyways ignored by
Git. The use case of that file is only in local environments. We will learn more
about the same in the upcoming chapters.

## Update Gemfile to use PostgreSQL

Installing and configuring "PostgreSQL" on a personal laptop can be tricky. So
here is what we are going to do.

We will use the `sqlite3` gem for both the `development` and `test`
environments.

We will use the `pg` gem only in the `production` environment. In this way, we
do not have to install `PostgreSQL` on our laptop.

Modify `Gemfile` to use `sqlite3` only in the development and test environment.

Note that in the following code, we have added `group`. It allows us to specify
the environment in which we want to use a particular gem:

```ruby
gem 'sqlite3', '~> 1.4', :group => [:development, :test]
```

Now let's add the `pg` gem for `production`:

```ruby
gem 'pg', :group => [:production]
```

The `=>` representation is called the hash-rocket representation and this is an
older way of writing the newer JSON-style representation, which is
`group: [:production]`.

Install the gems:

```bash
bundle install
```

## Add Uglifier

`Uglifier` is a Ruby wrapper for the `UglifyJS` JavaScript compressor. It is
required to compile the JavaScript assets.

Let's add the `uglifier` gem to the end of the Gemfile:

```ruby
gem "uglifier"
```

Install the gem:

```bash
bundle install
```

Add the highlighted line in the `config/environments/production.rb` file:

```ruby {4}
# previous code as it was
Rails.application.configure do
  # previous configs as it was
  config.assets.js_compressor = Uglifier.new(harmony: true)
end
```

## Update the manifest file

The `manifest.js` file inside the `app/assets/config` directory helps
`Sprockets` to determine which assets to include and serve.

Fully replace the `manifest.js` file with the following content:

```js
//= link_tree ../images
//= link_directory ../stylesheets .css
//= link_tree ../../javascript .js
```

## Update engines in package.json

We should specify the version of `node` and `yarn` that our application is using
in the `package.json` file. If we don't specify the version then different
versions can be used in different environments and machines and it can result in
failure when building the application.

We can use the `yarn -v` command to find the current version of the `yarn` in
the system. The `node` version should be exactly same as the version we have
mentioned in the `.nvmrc`. We can define the version for different engines in
`package.json`, like so:

```json
{
  "engines": {
    "node": "16.5",
    "yarn": "1.22.x"
  },
  ...
  <rest of the keys as it was>
}
```

## Creating a Heroku application

The first step in setting up Heroku is to
[Sign Up for Heroku](https://signup.heroku.com/).

Then, install the Heroku CLI.

If you are using macOS, then run the following:

```bash
brew tap heroku/brew && brew install heroku
```

For Ubuntu/Debian based distros, the installation command is:

```bash
sudo snap install --classic heroku
```

After installation, run:

```bash
heroku --version
```

Now you should be seeing the current version number if the Heroku command-line
interface (CLI) installation was successful.

Once we’ve verified that the Heroku command-line interface is installed, we need
to use the following Heroku command to log in:

```bash
heroku login
```

We will be redirected to authorize our account via browser.

**Note: All the commands given below should be run from the root of the
`granite` project.**

Finally, we need to create an application in Heroku. In this case, Heroku will
choose a random name for our application:

```bash
heroku create --stack heroku-20
```

We will see the output something similar to this:

```bash
Creating app... done, ⬢ agile-everglades-72910, stack is heroku-20
https://agile-everglades-72910.herokuapp.com/ | https://git.heroku.com/agile-everglades-72910.git
```

In the above command, we have also specified the Heroku stack while creating the
new Heroku application. A stack is an operating system image that is curated and
maintained by Heroku. According to the configuration of our granite application,
we should use the `heroku-20` stack.

We can verify the selected Heroku stack using the `heroku stack` command like
so:

```bash
heroku stack
```

The output should show `heroku-20` as the selected stack and will be like this:

```bash
  heroku-18
* heroku-20
  heroku-22
```

If `heroku-20` is not selected then we can update the Heroku stack in an
existing Heroku application using the command `heroku stack:set <stack>` like
so:

```bash
heroku stack:set heroku-20
```

We can use the `git remote` command to confirm that a remote named `heroku` has
been set up for your app:

```bash
git remote -v
```

The output will contain the initialized `heroku` remote, and would look
something like so:

```bash
heroku  https://git.heroku.com/agile-everglades-72910.git (fetch)
heroku  https://git.heroku.com/agile-everglades-72910.git (push)
```

The name of the application will be different for everyone. We will refer to it
as `<heroku_application_name>` here on.

## Setting up buildpacks

Heroku Buildpacks are sets of open source scripts that are used for compiling
apps on Heroku. They determine the build process for an app, and which assets
and runtimes should be made available to your code at runtime.

We will configure the following two buildpacks for our `granite` project.

Run the following commands from the root of your `granite` project:

```bash
heroku buildpacks:set heroku/nodejs --index 1
heroku buildpacks:set heroku/ruby --index 2
```

Let's see the list of buildpacks we have:

```bash
$ heroku buildpacks
...
1. heroku/nodejs
2. heroku/ruby
```

Ensure that both `nodejs` and `ruby` are in the list of buildpacks.

The order of the buildpacks matter. So please ensure that the order is as shown
in the above output.

This is because the last buildpack in the list will be used to determine the
process types for the application. Any process types defined from earlier
buildpacks will be ignored.

We will learn more about process types in the upcoming `Procfile` section.

After the buildpacks are set we also need to update our lockfile `yarn.lock`. We
can do so by running:

```bash
yarn install
```

This will make sure `yarn.lock` is up to date before we deploy our application.

## Setting up Heroku for deployment

Before we can deploy our branch to Heroku, we need to make sure to add platform
`x86_64-linux` to our `Gemfile.lock` file, otherwise we will receive an error
saying:

```text
Your bundle only supports platforms ["x86_64-darwin-20"] but your local platform is x86_64-linux.
Add the current platform to the lockfile with bundle lock --add-platform x86_64-linux and try again.
```

We also have to push our code to Heroku. To do that we also have to commit our
code till now. We can add this new platform and commit the code by running the
following commands from the terminal:

```bash
bundle lock --add-platform x86_64-linux
git add -A
git commit -m "Added linux platform to lockfile"
```

Now let's deploy the application to Heroku. Let's execute the following command
to deploy our application to Heroku:

```bash
git push heroku main
```

We should not push the code from the local development branch to Heroku. If we
are working on a local development branch, we should first create a PR and merge
it with the main branch. After merging pull the latest changes to the local main
branch and then push from the main branch to Heroku using the above mentioned
command that is `git push heroku main`. If we want to see the deployment for a
pull request we should use the "Review Apps" which are discussed later in this
chapter.

We need to manually migrate the database. This is **important** as we have to
apply all the migrations in the production database. Therefore, don't forget to
run the following command:

```bash
heroku run rails db:migrate -a <heroku_application_name>
```

To view the newly deployed application on the browser, execute the following
command:

```bash
heroku open
```

Note: The app may not be fully operational as we haven't set up Sidekiq in
Heroku. We will set it up in the upcoming chapter.

### Setting up auto deployment

- Log into Heroku and go to the overview page of the deployed application.
- Click on the `Deploy` tab.
- In the `deployment method` section, select `GitHub` and provide the GitHub
  details.
- Scroll to the `Automatic deploys` section and select the branch to be
  deployed. Let's keep it `main` for now.
- Click on the `Enable Automatic Deploys` button.
- Then, Heroku will display the message "Automatic deploys from `<branch_name>`
  is enabled".

The `<branch_name>` will be `main` by default.

Now anytime code is pushed to that branch, Heroku will automatically deploy the
latest code from that branch.

### Heroku commands

The following are some useful commands that will help you debug Heroku
application from your terminal itself.

To get into the Rails console of the deployed application, run the following
command:

```bash
heroku run rails console -a <heroku_application_name>
```

To check the logs of the application:

```bash
heroku logs -t -a <heroku_application_name>
```

To migrate the database:

```bash
heroku run rails db:migrate -a <heroku_application_name>
```

## Renaming the application

The auto-generated Heroku application names always look pretty weird.

We can rename the deployed application to `<new_application_name>` from the
initial `<heroku_application_name>` by executing:

```bash
heroku apps:rename <new_application_name> --app <heroku_application_name>
```

The `<new_application_name>` can be of the form
`granite-[github_username]-production`. You can replace the `[github_username]`
with your GitHub username so that the application name is unique.

**Strictly use your GitHub username in your Heroku app name. Unique
identification of your Heroku app is important.**

The `-production` suffix signifies that it is the production version of the app
and we can easily differentiate it from the other review apps. We will learn
about review apps in the next section.

An example app name for the GitHub user named `yedhink`:

```bash
granite-yedhink-production
```

## Setting up the Heroku pipeline

[Heroku pipelines](https://devcenter.heroku.com/articles/pipelines) allow us to
have a review app for each pull request. This is immensely useful in testing. We
no longer need to pull down all the changes and run the application locally to
see the application in action.

Here are the instructions to set up review apps for PRs:

- Log in at www.heroku.com.
- Visit https://dashboard.heroku.com/apps.
- Click on the "New" pull-down menu and then select "Create new pipeline".

  <image>create-new-pipeline.png</image>

- Enter the name of the pipeline as "granite-pipeline".
- Select your `granite` repository and then click on "Connect".
- Then click on "Create pipeline".
- Now click on "Enable Review Apps".

  <image>enable-review-apps.png</image>

- Check "Create new review apps for pull requests automatically".
- Choose a region - "United States".
- Click on "Enable Review Apps".
- Now when we send a pull request, Heroku will create a new review app for the
  corresponding PR.

  <image>review-app-deployment.png</image>

- When you click on "View Deployment", the review app will open up in a new tab.

This saves us a lot of time. This is especially useful while reviewing a PR.

## app.json file

The `app.json` file enables developers to define their application's details,
setup configurations, and runtime environments in a structured way. Setting up
an application for deployment is an error-prone and time-consuming task. With
the help of `app.json` file, we can set up our application for deployment in a
fast and efficient way.

`app.json` is a manifest file that defines the process of how the code can be
built into a live application. Instead of performing the same steps manually
every time we want to setup a review application in Heroku, we can define the
`app.json` with all the details and dependencies and add this file to the root
source of the code's directory.

An example `app.json` file would look something like the following:

```json
{
  "name": "graniteReviewApp",
  "scripts": {},
  "stack": "heroku-22",
  "env": {
    "RESET_DATABASE_WITH_SAMPLE_DATA": {
      "required": true,
      "value": "true"
    },
    "RACK_ENV": {
      "value": "heroku"
    },
    "RAILS_ENV": {
      "value": "heroku"
    },
    "HEROKU_APP_NAME": {
      "required": true
    },
    "LOG_LEVEL": {
      "value": "DEBUG"
    },
    "YARN_PRODUCTION": {
      "value": "true"
    },
    "NODE_MODULES_CACHE": {
      "value": "true"
    },
    "YARN_CACHE": {
      "value": "true"
    },
    "DEFAULT_SUBDOMAIN": {
      "value": "app"
    }
  },
  "addons": [
    {
      "plan": "heroku-postgresql",
      "options": {
        "version": "13"
      }
    },
    {
      "plan": "heroku-redis:hobby-dev",
      "options": {
        "version": "6"
      }
    }
  ],
  "buildpacks": [
    {
      "url": "heroku/nodejs"
    },
    {
      "url": "heroku/ruby"
    }
  ]
}
```

Let's check some of the specifications mentioned in the above shown example of
`app.json` file:

- `scripts`:

Under this property, we can define the various scripts or shell commands to
execute at different stages.

- `stack`:

It shows which [Heroku stack](https://devcenter.heroku.com/articles/stack) or
Heroku OS is used for the application.

- `env`:

This property carries an object consisting of all the config variables required
for the application's runtime environment.

- `addons`:

It's an array of strings and objects specifying the necessary Heroku add-ons
required by the application.

- `buildpacks`:

It's an array of objects specifying the URL of the required buildpacks to build
the application. The order of buildpacks in the array matters. The buildpack
mentioned earlier in the array will be loaded first.

Please note that this `app.json` file is only used for setting up the review app
in Heroku. We cannot automate deploying or setting up the other pipeline
instances using this file.

For more details refer to the
[app.json schema](https://devcenter.heroku.com/articles/app-json-schema) article
from Heroku documentation.

**The upcoming chapter is a continuation of this chapter. Please go through the
next chapter too, to make the app working in Heroku.**

There is **nothing to commit** in this chapter since all we had done was
deploying application on Heroku.
