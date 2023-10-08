## What are we building?

Let's learn Rails by building a simple web application. Let's name it `granite`,
after a [type of rock](https://en.wikipedia.org/wiki/Granite).

The application will be a simple todos for a whole company of small size. The
application will have the following features.

- Users will be able to prioritize the tasks by starring them. These starred
  tasks will be shown first in the list.
- Users can toggle the task as pending or done.
- Task creators can delete/edit the task.
- Users can add comments to the tasks. These comments cannot be edited/deleted.

Our goal is to learn the process of writing a Ruby on Rails application with
React.js.

## Live application

[Here's](https://granite-production.neetodeployapp.com/) the working demo of the
application.

Use the following credentials to login:

```text
email: oliver@example.com
password: welcome
```

If the above credentials don't work, then create a sign-up with a new user from
the UI and login with those new credentials.

## Setting up a new Rails application

Let's build a brand new Rails application. Rails offers us a command-line
utility to build a brand new Rails application.

Run this command to generate a new Rails application with a specific Rails
version:

```bash
rails _7.0.5_ new granite --skip-turbolinks
```

It will produce a long output and might take some time to complete. It is
downloading and setting up required files from the internet.

## Setting up Shakapacker

First, we need to run the `yarn install` command to generate the Yarn lockfile.

```bash
yarn install
```

Remove the `app/javascript` directory as it has some unwanted files. When we
install `shakapacker` it will create the `app/javascript` folder with the required
files.

Remove the `app/javascript` folder with the following command:

```bash
rm -rf app/javascript
```

[Shakapacker](https://github.com/shakacode/shakapacker)
is a tool that helps bundle JavaScript files using webpack 5+.
It is a successor to [Webpacker](https://github.com/rails/webpacker) and is based on version 6 of Webpacker. For the sake of simplicity we would using the terms `Webpacker` and `Shakapacker` interchangeably.

To install `shakapacker`, add the `shakapacker` gem at the end of the file
named `Gemfile`.

```rb
# For compiling and bundling JavaScript. Read more: https://github.com/shakacode/shakapacker
gem "shakapacker", "~> 6.6.0"
```

We are aware that the latest version of shakapacker is v7. However we ran into some issues
with that version. Hence we are locking shakapakcer to v6.

```bash
bundle install
```

Now, we can set up the base for `shakapacker` by running the following command.

```bash
bin/rails webpacker:install
```

The default configurations sets the source path `app/javascript` as the `source_entry_path`
in `config/webpacker.yml`. We need to set a subdirectory of the `source_path`, namely `packs`, to
be the `source_entry_path`. We also need to make other minor modifications in the webpack configuration. To incorporate all these, let's replace the contents of `config/webpacker.yml` with webpacker configuration from the [Wheel repository](https://raw.githubusercontent.com/bigbinary/wheel/main/webpacker.yml) by executing the following command from the root of the app:

```bash
curl -o "config/webpacker.yml" "https://raw.githubusercontent.com/bigbinary/wheel/main/config/webpacker.yml"
```

Now, let's move the file `app/javascript/application.js` to `app/javascript/packs/application.js`
as per the configuration set in `webpacker.yml`.

```bash
mkdir -p ./app/javascript/packs/
mv ./app/javascript/application.js ./app/javascript/packs/application.js
```

Next, let's add `.browserlistrc` file to the application.

```bash
echo "cover 95%" > .browserslistrc
```

The browserslist configuration controls the outputted JavaScript so that the emitted code
will be compatible with the browsers specified. `cover 95%` selects the smallest set of popular
browser versions with collective usage over 95% of the audience worldwide.

To ensure a single configuration and avoid redundancy, let's remove the following three lines that specify the browserlist configuration inside the `package.json` file, considering that we already have a separate `.browserlistrc` file.

```json
  "browserslist": [
    "defaults"
  ]
```

Let's now install the below packages to our project as a part of the webpack configuration:

```bash
yarn add @svgr/webpack@^8.1.0 babel-plugin-dynamic-import-node@^2.3.3 babel-plugin-macros@^3.1.0 babel-plugin-js-logger@^1.0.17 css-loader@^6.8.1 dotenv-webpack@^8.0.1 i18next ignore-loader@^0.1.2 mini-css-extract-plugin@^2.7.6 js-logger@^1.6.1 postcss@^8.4.29 postcss-flexbugs-fixes@^5.0.2 postcss-import@^15.1.0 postcss-loader@^7.3.3 postcss-preset-env@^9.1.2 process@^0.11.10 ramda sass@^1.66.1 sass-loader@^13.3.2 source-map-loader@^4.0.1 style-loader@^3.3.3
```

Let's also add a `babel.config.js` file with base configurations at the root of the project. Execute the following command to download and use babel configuration from the [Wheel repository](https://raw.githubusercontent.com/bigbinary/wheel/main/babel.config.js).

```bash
curl -o "babel.config.js" "https://raw.githubusercontent.com/bigbinary/wheel/main/babel.config.js"
```

The `babel.config.js` file is used to configure Babel's behavior, including which presets
and plugins to use, which files to include or exclude from the compilation process, and
other settings.

To ensure a single configuration and avoid redundancy, let's remove the following five lines that specify the babel configuration inside the `package.json` file, considering that we already have a separate `babel.config.js` file.

```json
  "babel": {
    "presets": [
      "./node_modules/shakapacker/package/babel/preset.js"
    ]
  }
```

## Customizing Shakapacker configuration

Shakapacker gives us a default configuration file `config/webpack/webpack.config.js`.
However, we need to customize this by modifying the webpack configuration, to suit our
application.

When setting up Webpacker, having files like `environment.js`, `development.js`,
`production.js`, etc, allows us to configure different settings for different
environments in the application.

The `environment.js` file is used to configure settings that are common across all
environments, such as which JavaScript packs to load and which plugins to use. By
separating configuration into different files based on environment, developers can
easily manage and maintain their Webpacker configuration without having to duplicate
code or remember which settings apply in which environment.

Let's import these customized configurations from `wheel` by running the below command:

```bash
raw_base_url="https://raw.githubusercontent.com/bigbinary/wheel/main"
declare -a configs=(
  "config/webpack/environment.js"
  "config/webpack/development.js"
  "config/webpack/production.js"
  "config/webpack/test.js"
  "config/webpack/rules.js"
  "config/webpack/webpack.config.js"
  "config/webpack/helpers/customize-default-rules.js"
  "config/webpack/helpers/utils.js"
)
for config in "${configs[@]}"; do
  echo "Downloading ${config}..."
  curl --create-dirs -o "${config}" "${raw_base_url}/${config}"
done
```

Let's also create a file `resolve.js` inside `config/webpack` to handle alias using the
below command.

```bash
touch config/webpack/resolve.js
cat << EOF > config/webpack/resolve.js
const path = require("path");

const absolutePath = basePath =>
  path.resolve(__dirname, "..", "..", \`app/javascript/\${basePath}\`);

module.exports = {
  alias: {
  },
  extensions: [
    ".ts",
    ".mjs",
    ".js",
    ".sass",
    ".scss",
    ".css",
    ".module.sass",
    ".module.scss",
    ".module.css",
    ".png",
    ".svg",
    ".gif",
    ".jpeg",
    ".jpg",
  ],
};
EOF
```

We will discuss more about alias in the coming chapters so you don't have to be concerned now.

## Update to stylesheet pack tag

The default Rails application ERB template file,
`app/views/layout/application.html.erb`, contains:

```erb
<%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
<%= javascript_importmap_tags %>
<%= javascript_pack_tag "application" %>
```

In that file, we need to replace `stylesheet_link_tag` with
`stylesheet_pack_tag` to attach CSS packs.
We need to replace `javascript_importmap_tags` with
`javascript_pack_tag` to handle JavaScript files.

After the change the `application.html.erb` would look like this.

```erb {1,2}
<%= stylesheet_pack_tag "application" %>
<%= javascript_pack_tag "application" %>
```

We will discuss in depth about why we need to do this replacement towards the
end of the book.

If you're very curious and don't mind the complexity at this early
stage itself, then you can give
[this section](/learn-rubyonrails/webpacker-in-depth#significance-of-stylesheet-pack-tag)
a read to understand about Webpacker's CSS compilation in depth.

## Configuring default Ruby and Node.js versions

We can lock our application with a specific Ruby and Node.js version. This will
help us to isolate the dependencies of Ruby and Node.js modules used in the
application.

In our application, we will use Node.js version `18.12` and Ruby version `3.2.2`.

Run the following commands from the terminal:

```bash
echo "18.12" > .nvmrc > .node-version
echo "3.2.2" > .ruby-version
```

These files will be read by `rbenv` and `nvm` to auto-set the versions.

Now run the following commands from the terminal to ensure that our project is
currently using these specified versions:

```bash
rbenv install
nvm install
```

The above commands should ideally point out that the specified versions are
already installed and you can safely exit. If that's not the case, then please
go ahead with the installation of the required versions, using the same
commands.

### Fixing rexml gem issue

We are not going to use some of the auto-generated gems for testing. Thus let's
remove those unwanted gems, among which there are `selenium` based gems that may
cause `rexml` dependency issue.

Run the following command from the terminal:

```bash
bundle remove capybara selenium-webdriver webdrivers
```

The above command should've removed those unwanted gems from the `Gemfile`.

### Remove unwanted gems

Some gems come pre-installed in Rails 7 but are not required for our Granite
application like `importmap-rails`, `turbo-rails`, and `stimulus-rails`.

Remove the following lines, including the comments, from the `Gemfile`:

```ruby
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
```

Then update the `Gemfile.lock` file by running the following command:

```bash
bundle install
```

### Updating .gitignore file

We don't need all of the generated files to be version-controlled. To ignore
these unwanted files, we specify them in the `.gitignore` file. BigBinary has
specified a standard set of folders and files to be ignored by git in the
[Wheel repository](https://raw.githubusercontent.com/bigbinary/wheel/main/.gitignore).

Run the following command from the terminal, in the root of the project, to use
that config:

```bash
curl -o ".gitignore" "https://raw.githubusercontent.com/bigbinary/wheel/main/.gitignore"
```

Now the `.gitignore` file should be visible in your project's root.

## Removing fixtures

In a future chapter, we will see why we are removing fixtures. For now, let's
just go ahead and disable the fixtures.

To disable using fixtures open `test/test_helper.rb` and comment out the line
shown below.

```ruby
# fixtures :all
```

Execute the following lines on the terminal to delete the fixtures folder
completely:

```bash
rm -rf test/fixtures
```

### Ensure fixtures won't get generated

Rails provide several generator commands that help in generating boilerplate
code for models, controllers, migration scripts, etc. We will be using them
throughout the book.

But, with some of those generators, fixture files also get generated by default.
We won't need those fixture files.

Fortunately, we can customize Rails generators to disable the auto-generation of
fixtures for all the commands.

To do that, add the following lines in `config/application.rb`:

```ruby {10-12}}
require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Granite
  class Application < Rails::Application
    # previous code if any

    config.generators do |g|
      g.test_framework :test_unit, fixture: false
    end
  end
end
```

For simple applications, we can always rely on using `ActiveRecord` queries to
create seed data for tests instead of fixtures. We will learn about them in the
upcoming chapters.

## Creating database

[SQlite3 database](https://www.sqlite.org/index.html) is the default database
for a newly created Rails application.

Run this command to create databases for our application:

```bash
bundle exec rails db:create
```

The output will look like this:

```text
Created database 'db/development.sqlite3'
Created database 'db/test.sqlite3'
```

## Starting the server

Now let's start the server. Run this command:

```bash
bundle exec rails server
```

The output would look like this:

```text
=> Booting Puma
=> Rails 7.0.6 application starting in development
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 6.3.0 (ruby 3.2.2-p53) ("Mugi No Toki Itaru")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 94444
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
```

Open the browser and visit [http://localhost:3000](http://localhost:3000). We
will see a page that would look like this:

<image>new-rails-project-landing-page.png</image>

## Verify Ruby and NodeJS versions

Before committing the files, let's verify whether our Ruby and Node.js versions
are the required versions or not, by running the following commands from the
terminal:

```bash
rbenv version # should be 3.2.2
nvm version # should be v18.12.1
```

Also from the root of the project run the following command to double-verify
that Ruby is set to the required version:

```bash
ruby -v # should be 3.2.2
```

Another final point of verification is the version line in the `Gemfile`, which
can be found at the root of the project. The following line with required
version should be present within the `Gemfile`:

```ruby
ruby "3.2.2"
```

If the Ruby version is not matching the `rbenv` set version, then it means that
there is a system-level Ruby version that is taking precedence. In that case,
you'd have to set the Ruby version globally as mentioned in the
[previous chapter](/learn-rubyonrails/installing-ruby-on-rails#installing-ruby-on-rails-on-macos).

Once verified, add this new application to git:

```bash
git add -A
git commit -m "Initial commit"
git rm -r --cached . # to reapply gitignore
git add -A
git commit -m "Applied gitignore"
```