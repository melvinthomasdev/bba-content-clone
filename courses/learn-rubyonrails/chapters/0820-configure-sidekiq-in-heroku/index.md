In the previous chapter, we have deployed our application to Heroku. However, we
also need to set up Sidekiq on Heroku to process background jobs.

## Credit card details

- First, we need to have the `heroku-redis` add-on for our project.
- **To use an add-on, we need to verify our account using a credit card.**
- Ultimately the credit card is used to verify that the user is not bogus.
- Since it's a free add-on, the credit card won't be charged for usage.
- If we don't have a verified account, then we can't add the Redis add-on and
  thus won't be able to directly make `sidekiq` work in Heroku!

**Note:** If you don't own a credit card and is a part of the BigBinary
Internship/TB-3 program, then please ask your mentor for the credit card
details. Using that credit card, you can verify yourself as a non-bogus user and
thereby add the free `heroku-redis` add-on.

## Verifying account

To verify your Heroku account:

- Go to your Account Settings in the Heroku Dashboard.
- Click on the "Billing" tab.
- Click on "Add Credit Card" and then enter the credit card details.

**Note:** Several people have faced issues when verifying their credit cards in
Heroku. As per the response from Heroku Support
`"Cards can occasionally get stuck in the verification process which requires manual intervention to resolve"`.

If you face this issue you can get further information about it from the
[official support docs](https://help.heroku.com/04UOS4A3/why-am-i-seeing-the-error-unable-to-verify-your-card-when-trying-to-add-or-update-a-credit-card).
You can also contact
[Heroku Support](https://help.heroku.com/n/2/billing-verification-payments) to
try and resolve the issue.

## Adding the heroku-redis add on

Assuming we have a verified account, the next step is to add `heroku-redis` to
our project. Two ways to set it up.

### Using the Heroku Dashboard

Go to the `resources` tab, and in the `Add-ons` section type `Heroku Redis` in
the search field and add it.

<image>heroku-redis-addon.png</image>

Select the `Hobby Dev - Free` plan and click `Submit Order Form`.

<image>heroku-redis-addon-plan.png</image>

### Or using the Heroku CLI

Run the following from the root of the project, if you haven't already added the
`heroku-redis` add-on:

```bash
heroku addons:create heroku-redis:hobby-dev
```

## A brief introduction to Procfile and Heroku dynos

Before setting up the `Procfile`, let us understand what it is.

The `Procfile` specifies the commands that are executed by the app on startup.
You can use a Procfile to declare a variety of `process types` like your app's
web server, worker processes etc.

Also, let us understand what Heroku `dynos` are.

All Heroku applications run in a collection of lightweight Linux containers
called `dynos`. There are three types of dyno configurations:

- Web: Web dynos are dynos of the “web” process type that is defined in your
  `Procfile`. This is where our server usually runs.

- Worker: Worker dynos can be of any process type declared in your Procfile,
  other than “web”. Usually, it's denoted using the `worker`. Worker dynos are
  typically used for background jobs, queueing systems, and timed jobs. Our
  Sidekiq worker will use this type of dyno configuration.

- One-off: One-off dynos are temporary dynos that can run detached, or with
  their input/output attached to your local terminal. For example, when you use
  your terminal to access the Rails console of your Heroku app, you make use of
  this type of dyno configuration.

Now, since we have got an idea of what a Procfile is, let us create a file named
`Procfile` (**Note** - no file extension needed) in our `granite` app's root
directory and add the following to it:

```bash
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -e production -C config/sidekiq.yml
release: bundle exec rake db:migrate
```

The `release` resource in the Procfile is used to ensure that upon pushing
changes to Heroku it will run the latest migrations.

The rake `setup` task helps in setting up the project on a new machine for
development. This rake `setup` task helps in setting up the project by creating
the database, running all the latest migrations, and then seeding the database
with sample data.

We should not be seeding data in the production or staging environment unless
it's communicated otherwise. We seed the database in the development environment
so that we can quickly setup the project and test the working of the project. If
we execute the rake `setup` task via the `release` process of Procfile then the
database will be created and all migrations will be migrated but the seeding of
the database will not take place because we have added a condition in the task
file to populate data only if the environment is not production and staging,
like this:

```rb
task populate_with_sample_data: [:environment] do
  if Rails.env.production?
    puts "Skipping deleting and populating sample data in production"
  elsif Rails.env.staging?
    puts "Skipping deleting and populating sample data in staging"
  else
    create_sample_data!
    puts "sample data has been added."
  end
end
```

Although we can override the conditions to seed the database in a production or
staging environment, we shouldn't override these conditions unless we consult
with the tech lead of the project.

To know more about the importance of `./bin/setup` file, please checkout this
[section](/learn-rubyonrails/setting-up-rake-tasks#importance-of-bin-setup-file)
from the "Setting up Rake tasks" chapter.

Now let's push our application to Heroku, by running the following:

```bash
git push heroku main
```

## Activating Heroku dynos

Dynos are not activated by default in Heroku. We have to scale our app to use
the required dynos.

Let us scale our application to use both the `web` and `worker` dynos via the
Heroku CLI.

Run the following from the root of the `granite` application:

```bash
heroku ps:scale web=1
heroku ps:scale worker+1
```

We don't need to scale the `release` resource since it will be automatically run
once by Heroku upon pushing latest changes.

If you're confused about what's happening with the above command, then you can
make use of the Heroku dashboard UI too, to do the same job.

You can also use the Heroku dashboard to activate/de-activate a dyno by doing
the following:

- Navigate to the `Resources` tab.
- In the app's list of dynos, click the `Edit` button and use the toggle switch
  to activate/de-activate a particular dyno.

<image>heroku-dynos-dashboard.png</image>

## Gotchas with Sidekiq in Heroku

- Sometimes our active jobs/background jobs get enqueued and not get processed
  in Heroku. To avoid that, make sure you have completed the above steps, and
  then add the following under your `production` key in `config/database.yml`:

```yaml
url: <%= ENV['DATABASE_URL'] %>
```

- [`Optional`][`rare case`] Sometimes the jobs even after doing the above steps,
  gets enqueued in Heroku without processing. Weird right? Then we can invoke
  the job from our `Task` model as mentioned below, which hopefully should fix
  it:

```ruby
  after_commit :log_task_details, on: :create
```

## Viewing the Sidekiq Web UI

This is an optional step, which you can execute if you want to monitor Sidekiq
processes via browser.

### Configuring Heroku Config Variables for Sidekiq

In the production environment, we need to authenticate the user before giving
access to the Sidekiq Web UI. So we need to set up two env or config variables
in our Heroku project:

```yaml
SIDEKIQ_USERNAME: <some_username>
SIDEKIQ_PASSWORD: <some_password>
```

Here are the detailed steps to do so:

- Navigate to the `Settings` tab.
- Go to the `Config Vars` section and click on the `Reveal Config Vars` button.
- Add the following env variables whose values would be a username and a
  password of your choice.

<image>heroku-config-vars.png</image>

Now that we have setup the Heroku config vars, let's configure the routes.

### Adding authentication to Sidekiq Web UI

We need to add the following into the `routes.rb` file to authenticate a user
before giving access to the Sidekiq Web UI:

```ruby {1-2, 5-9}
require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
  end
  mount Sidekiq::Web, at: "/sidekiq"

  constraints(lambda { |req| req.format == :json }) do
    resources :tasks, except: %i[new edit], param: :slug
    resources :users, only: %i[create index]
    resource :session, only: %i[create destroy]
    resources :comments, only: :create
    resource :preference, only: %i[show update] do
      patch :mail, on: :collection
    end
  end

  root "home#index"
  get '*path', to: 'home#index', via: :all
end
```

Even with such a barebones routes file, it's already looking very cluttered and
pretty unreadable.

When writing code the key point to focus on is to make code readable. Someone
else might be working on the same codebase in the future. Thus naming and
properly modularizing go a long way.

Let's see how we can make the `routes.rb` file look cleaner.

### Modularizing routes file

Therefore, to enhance readability, we can break the `routes.rb` file into
multiple small units:

```ruby {1-2, 4-9}
require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  draw :sidekiq

  #previous routes as is
```

Here, we have defined a custom macro named `draw`. As we had discussed in
previous chapters, a macro is a method, which instead of returning a Ruby
datatype, returns more Ruby code.

This `draw` macro allows us to load smaller route files from the `config/routes`
folder. Now let's configure a route file for `sidekiq`.

Run the following command:

```bash
touch config/routes/sidekiq.rb
```

Open the file and add the following:

```ruby
# frozen_string_literal: true
require "sidekiq/web"

def sha256_digest(value)
  ::Digest::SHA256.hexdigest(value)
end

def secure_compare(string, key)
  sidekiq_web_credentials = Rails.application.secrets.sidekiq
  expected_credential = sidekiq_web_credentials && sidekiq_web_credentials[key]
  return false if [string, expected_credential].any?(&:nil?)

  ActiveSupport::SecurityUtils.secure_compare(
    sha256_digest(string),
    sha256_digest(expected_credential)
  )
end

mount Sidekiq::Web => "/sidekiq"

if %w[staging production].include?(Rails.env)
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    secure_compare(username, :username) & secure_compare(password, :password)
  end
end
```

Let us make use of the `secrets.yml` file to access the env/config vars we have
configured in Heroku into our Rails application.

Fully replace the `config/secrets.yml` file with the following content:

```yaml
default: &default
  redis_url:
    <%= ENV['REDISTOGO_URL'] || ENV['REDIS_URL'] || 'redis://localhost:6379/1'%>
  sidekiq:
    username: <%= ENV['SIDEKIQ_USERNAME'] %>
    password: <%= ENV['SIDEKIQ_PASSWORD'] %>

development:
  <<: *default

test:
  <<: *default

staging:
  <<: *default

production:
  <<: *default
```

Now, let us understand the various methods defined in
`config/routes/sidekiq.rb`. We have split the code into these methods for
enhancing readability and reusability.

- The `secure_compare` method uses the built-in
  `ActiveSupport::SecurityUtils.secure_compare` method for string comparison. We
  are making use of this method to prevent timing attacks.

A **timing attack** uses statistical analysis of how long it takes for your
application to do something to learn something about the data it’s operating on.

While an attacker cannot use a timing attack to find out the secrets, it is
possible to determine the secret length. Now here's where our `sha256_digest`
method will come to the rescue.

The `[string, expected_credential].any?(&:nil?)` part checks whether either the
configured credential or supplied credential is nil.

If any of those values are nil, then we have to fail our authentication.

To mark the process as failure, we can return `false` value.

But what does `&:nil?` in `[string, expected_credential].any?(&:nil?)` denote?

By prepending `&` to a symbol we are creating a lambda function that will call
method with a name of that symbol(`.nil?` here) on the object you pass into this
function.

So the above statement is equivalent to the following:

```ruby
[string, expected_credential].any? { |item| item.nil? }
```

- The `sha256_digest(value)` method computes and returns a 256-bit hash or
  message digest of the `value` parameter supplied.

We are computing the message digest because, doing so will prevent leaking of
the length information of `value`.

Irrespective of the length of `value`, this method will always return a 256-bit
hash.

Also, the hashing function used is one-way i.e, one cannot compute the original
value from the digest.

Now you can view the Sidekiq Web UI by navigating to the `/sidekiq` endpoint.

Note that we have enabled authentication only in `staging` and `production`
environments.

In the `development` environment we can directly access the Sidekiq Web UI
without providing any credentials.

<image>heroku-sidekiq-auth.png</image>

A sample preview of the Sidekiq Web UI:

<image>sidekiq-web-ui.png</image>

Now commit the changes that were made in this chapter:

```bash
git add -A
git commit -m  "Added Heroku Sidekiq configs"
```
