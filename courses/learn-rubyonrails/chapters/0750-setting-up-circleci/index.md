## What is CircleCI?

When we send pull request with code change we want to ensure that the changed
code does not break our test. So we need to run all the tests of the application
every single time we send a pull request or every single time we make a commit
to the pull request.

Here, CircleCI comes into the picture. CircleCI runs those tests and provides
feedback in our pull request.

CircleCI is a modern continuous integration and continuous delivery (CI/CD)
platform. CircleCI automates build, test, and deployment of software.

**Note:** Before setting up CircleCI make sure to push your code to a Github
repo to see it listed in the CircleCI projects tab.

## CircleCI setup

To do CircleCI setup, we need to follow below steps:

### Login at CircleCI

Visit [CircleCI](http://circleci.com) and login using your GitHub account.

### Add project

Click the `projects` button from the left-hand side menu. Then select the
project you want Circle-CI to test for you, and click the `Setup Project`
button.

Then we would be navigated to a new page which would display a config file.

### Build project

We should see `Add config` button click on it. After that click a new branch
would be created in your repository as `circleci-project-setup` .

And it would add a generic config.yml file under the .circleci directory in root
folder of the application `.circleci/config.yml`.

### Updating config.yml file

Add the following code to `.circleci/config.yml`:

```yaml
version: 2.1
orbs:
  # To install the required node version
  node: circleci/node@5.0.3
jobs:
  build:
    # No. of servers/machines
    parallelism: 1
    docker:
      - image: cimg/ruby:3.2.2
      - image: cimg/redis:5.0.14
      - image: cimg/postgres:9.6
        environment:
          POSTGRES_HOST_AUTH_METHOD: trust

    #application directory change it with your application directory name
    working_directory: ~/granite
    environment:
      TZ: "/usr/share/zoneinfo/America/New_York"
      RAILS_ENV: "test"
      RACK_ENV: "test"

    steps:
      - checkout
      - node/install:
          install-yarn: true
          node-version: "18.12"
      - run: node --version
      - run: gem install bundler:2.2.20
      #install sqlite dependency
      - run: sudo apt update && sudo apt install zlib1g-dev libsqlite3-dev
      # Bundle install
      - run: bundle check --path=vendor/bundle || bundle install
          --path=vendor/bundle --jobs=4 --retry=3
      # Yarn install
      - run: yarn install --cache-folder vendor/node_modules
      # Ensure Rubocop has linted all Ruby files
      - run: bundle exec rubocop
      # Ensure Prettier+ESLint has been run on all JS files
      - run:
          npx prettier "./app/javascript/src/**/*.{js,jsx,json}" && npx eslint
          "./app/javascript/src/**/*.{js,jsx,json}"
      # Setup database
      - run: cp config/database.yml.ci config/database.yml
      - run: bundle exec rails db:create db:schema:load --trace
      # Generate assets
      - run: chmod a+x ./bin/webpacker && ./bin/webpacker
      - run: bundle exec rails webpacker:compile
      # Unit tests
      - run:
          shell: /bin/bash
          command: bundle exec rake db:test:prepare && bundle exec rails t -v
workflows:
  version: 2
  commit:
    jobs:
      - build
```

**Note** that to ensure linting and formatting is strictly done using the
configs mentioned in the
[linting and formatting chapter](/learn-rubyonrails/linting-and-formatting-code),
we added relevant tasks in CircleCI too.

If the CircleCI build fails, then you will get an email for the same. Or you can
check the last commit in GitHub and confirm whether there's a green tick mark or
not. Green tick mark means build has passed successfully.

### Updating database.yml.ci

This config file expects a file at `config/database.yml.ci` . We don't have that
file right now. Let's add that file.

Open terminal and execute following command:

```bash
touch config/database.yml.ci
```

Now open `config/database.yml.ci` and add the following code:

```yaml
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

development:
  <<: *default
  database: db/development.sqlite3

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: granite_test<%= ENV['CIRCLE_NODE_INDEX'] %>

production:
  <<: *default
  database: db/production.sqlite3
```

Check in all the changes and push the changed code to GitHub. Before proceeding
further please ensure that these changes are pushed to GitHub and these changes
are there in the master branch of the repository.

### CircleCI config for PostgreSQL

In the Granite project, we are using `SQLite` in the development environment but
if we use `PostgreSQL` then we need to install `postgresql-client` in place of
`libsqlite3-dev` in the `CircleCI` container and the `.circleci/config.yml`
should be updated like this:

```yaml {15}
version: 2.1
orbs:
  node: circleci/node@5.0.3
jobs:
  build:
    # rest of the config
    steps:
      - checkout
      - node/install:
          install-yarn: true
          node-version: "18.12"
      - run: node --version
      - run: gem install bundler:2.2.20
      # install postgresql dependency
      - run: sudo apt update && sudo apt install postgresql-client
# rest of the config
```

If the project uses `PostgreSQL` in the development environment then we would
have to provide some extra configurations like `host` and `user`, and update the
`config/database.yml.ci` file like this:

```yaml
default: &default
  adapter: postgresql
  host: 127.0.0.1
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: granite_development

test:
  <<: *default
  user: postgres
  database: granite_test<%= ENV['CIRCLE_NODE_INDEX'] %>

production:
  <<: *default
  database: granite_production
```

If we don't add the `host` and `user` in the `database.yml.ci` file, then
CircleCI will fail with an error of `role "circleci" does not exist`. As no role
is mentioned in the CircleCI's database config file that is `database.yml.ci`,
the CircleCI will try to create the database with the `circleci` role and will
fail with an error like this:

<image alt="CircleCI role does not exist">circleci-role-not-exist.png</image>

We don't have to make the above mentioned changes in our Granite app as we are
using `SQLite` in the development env.

### Running a build through a pull request

Create a pull request and we will see that as soon as pull request is raised the
CircleCI starts running the tests.

## Common CircleCI errors and their solutions

### Rubocop failing in CircleCI

This is quite possible to happen in the first run with CircleCI.

The reason is that when we create a Rails application in the first place, a lot
of Ruby files will be added, but no linting nor formatting is applied to it.

Thus what we can do is to run Rubocop on all relevant files, like this, from our
terminal:

```bash
bundle exec rubocop -A
```

Once done, verify all offenses are corrected. You check if anymore offenses are
remaining by committing the already modified files using Git, since it will
invoke our Git hooks.

You might've to manually correct some Rubocop offenses in the pointed out files.

Example:

<image alt="Rubocop uncorrectable offenses.">git-hooks-rubocop-non-correctable-offenses.png</image>

Once everything is done, re-push to the GitHub branch with CircleCI tracks and
things should be working.

### Bundle check: Could not find 'bundler' (version)

To resolve this issue, make sure that the right version of bundler is used
before building. Add the following line in your `.circleci/config.yml` file
under steps `- run: gem install bundler:version` . Here `version` is the version
with which your Gemfile.lock is bundled. It is at last line of your
Gemfile.lock:

```yml
steps:
  - checkout
  - run: gem install bundler:2.1.4
```

### Your Ruby version is X, but your Gemfile specified Y

To fix this issue, we need to keep the Ruby version consistent everywhere. Here
are some solutions:

1. Ensure that the Ruby version mentioned in ".circleci/config.yml" under jobs
   -> build -> docker -> image has the right Ruby version.
2. Ensure that the Ruby version at the top of Gemfile has the right Ruby
   version.
3. Ensure that the Ruby version in `.ruby-version` file has the same value.
4. Ensure that the Ruby version file `.ruby-version` is present in GitHub. Some
   folks ignore this file.

### Error connecting to redis

While setting CircleCI we can face an error mentioning "Error connecting to
Redis on localhost". It can happen if we are testing some services which require
the Redis server and we haven't added the Redis image to the CircleCI container.

As we had mentioned above, we should specify the docker image for `redis` in the
`.circleci/config.yml` like this:

```yml {10}
version: 2.1
orbs:
  node: circleci/node@5.0.3
jobs:
  build:
    # No. of servers/machines
    parallelism: 1
    docker:
      - image: cimg/ruby:3.2.2
      - image: cimg/redis:5.0.14
      - image: cimg/postgres:9.6
```

Now, let's commit the changes:

```bash
git add -A
git commit -m "Setup the CircleCI"
```
