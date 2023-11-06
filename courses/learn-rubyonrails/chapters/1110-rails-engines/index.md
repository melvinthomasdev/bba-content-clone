In this chapter, we will learn what Rails engines are and how, as a modular
functionality, they can improve the quality and usability of an application.

## Rails Engines

We are already familiar with how a Rails application works. In essence, a Rails
application is a standalone web application that is built using the Rails
framework. It consists of a set of Ruby classes and files that define the
behavior and functionality of the application, as well as a set of templates and
views that define the user interface.

A Rails Engine is very similar to a Rails application in the way it encapsulates
a real-world scenario. Engines can be thought of as miniature applications that
share the `same structure` where directories like `app`, `config`, `test` among
others get generated magically. To put it in other terms, a Rails Engine is a
whole Rails app that lives in the container of another one.

Rails Engines are designed to be mounted within a larger Rails application,
allowing the host application to reuse and extend the functionality provided by
the Engine. This can be useful for building reusable components that can be
shared across multiple applications, as well as for separating larger
applications into smaller, more manageable pieces. This might give you the
impression that Engines and Ruby gems operate similarly.

Unsurprisingly, they share a common trait. Rails Engines are essentially
self-contained Ruby gems that provide a specific set of functionality that can
be shared across multiple Rails applications.

## When should you use a Rails Engine?

Let us see some situations where you might want to use a Rails Engine in your
Ruby on Rails application:

- Sharing common functionality across multiple applications: If you have
  multiple Rails applications that share a common set of functionality, you can
  extract that functionality into a Rails Engine and use it across all of your
  applications. For example, you might have a set of user management features
  that are used by multiple applications, and you could extract these features
  into a Rails Engine to make them easier to maintain and update.

- Modularizing a large application: If you have a large Rails application that
  is becoming difficult to manage, you can use a Rails Engine to break it down
  into smaller, more manageable pieces. This can make it easier to understand
  the codebase, as well as to test and deploy changes.

- Adding custom functionality to an existing application: If you have an
  existing Rails application that you want to add custom functionality to, you
  can create a Rails Engine to do so. This allows you to extend the application
  without modifying its core codebase, which can be useful for maintaining
  backward compatibility and minimizing the risk of breaking existing
  functionality.

- Improving performance: Because a Rails Engine is a self-contained gem, it can
  be loaded and initialized separately from the rest of the host application.
  This can improve the performance of the application by reducing the number of
  files that need to be loaded and the amount of code that needs to be executed
  on startup.

Overall, using a Rails Engine can be a useful way to structure and organize your
code, as well as share functionality across multiple applications.

## Creating a Rails Engine

Let us take an example of an imaginary `Party` Rails application. The
application performs a lot of jobs like organizing events, managing invitations
etc. We will not dive much into the details of the application. But to support
the app, let us say, you are told to create a simple Rails Engine `greet`. This
engine should be designed with the sole objective of greeting the attendees.

We will start by generating the Engine.

```bash
rails plugin new greet --mountable
```

This will generate a new Engine skeleton where you can add your models,
controllers and other components as needed.

You might notice that the structure is very similar to a typical Rails
application. One difference you might note is the abundance of namespaced
directories. For example, in `app/controller` you might find another directory
named `greet`. This is because the `--mountable` option tells the generator that
you want to create a "mountable" and namespace-isolated engine. A
namespace-isolated-engine is isolated from the host application by a namespace.
This means that the engine's models, controllers, and other components are
defined within a separate module, which helps to prevent conflicts with the host
application's components.

Now let us create a `Receptions` controller.

```bash
 bin/rails g controller Receptions
```

`bin/rails` enables you to use the Rails sub-commands and generators just like
you would within an application. This means that you will be able to generate
new controllers and models for this engine using `bin/rails` easily.

Now within `app/controllers/greet/receptions_controller.rb` let us add the
following code:

```rb
require_dependency "greet/application_controller"

module Greet
  class ReceptionsController < ApplicationController
    def index
      name = params[:name] || 'World'
      render plain: "Hello, #{name}!"
    end
  end
end
```

The `index` action within the `ReceptionsController` ensures that a personalized
greeting would be displayed when a user visits the web page with his/her name
passed in as a parameter.

We have not defined the route yet. So include the following lines inside
`config/routes.rb` in your `greet` Engine.

```rb
Greet::Engine.routes.draw do
  root to: "receptions#index"
end
```

This will point the root to `receptions#index` action.

Now we have created a simple `greet` Engine. We will explore how to mount the
Engine we have created in a Rails application in the next section.

## Using Engines within host applications

Now consider we have to mount our `greet` Engine to a `Party` application. We
will start by including this line in the Rails application's Gemfile:

```rb
gem 'greet', path: 'path/to/greet'
```

We will now run `bundle install` as usual. By specifying the engine as a gem
within the Gemfile, Bundler will load it as such, parsing this `greet.gemspec`
file and requiring a file within the lib directory called `lib/greet.rb`. This
file requires the `greet/engine.rb` file (located at `lib/greet/engine.rb`) and
defines a base module called `Greet`.

You should note that with the isolation of the namespace, a controller generated
by a call to `bin/rails generate controller`, such as
`bin/rails generate controller Receptions`, won't be called `Receptions`, but
instead be namespaced and called `Greet::Receptions`. The same applies to any
model generated within the Engine.

Also if we have any migrations to run pertaining to the Engine, then we must
first run:

```bash
bin/rails greet:install:migrations
```

This command, when run for the first time, will copy over all the migrations
from the engine. When run the next time, it will only copy over migrations that
haven't been copied over already.

Sometimes you might need to access classes in a host application within your
Engine. This can be done by introducing proper associations. You can learn more
about this in the
[official docs](https://guides.rubyonrails.org/engines.html#using-a-class-provided-by-the-application).
Code for generating migrations for these associations can be, in fact,
efficiently written into custom
[generators](https://guides.rubyonrails.org/generators.html) making the
association setup more reusable.

To run these migrations within the context of the application, run
`bundle exec rails db:migrate`.

Since our `greet` engine does not have any migrations we will not do this now.

Now to access the functionality provided by the `greet` Engine using the routes
defined within it, we mount the Engine in the `config/routes.rb` file inside the
`Party` application.

```rb
Rails.application.routes.draw do
  mount Greet::Engine => "/greet"
end
```

Now our mounted Engine is ready to use. You can access the greeting
functionality by visiting the `/greet` route in your application, and you can
customize the greeting by passing a name parameter in the query string.

For example, visiting `/greet?name=Alice` would display the greeting "Hello,
Alice!", while visiting `/greet` without a name parameter would display the
default greeting "Hello, World!". This demonstrates how a Rails Engine can
provide modular functionality that can be easily accessed and customized within
a host application.

## Overriding Engine classes

Now that you have added the `greet` Engine, assume that you want to modify the
index action of the `Receptions` controller from the host application. You can
do this by overriding the `Receptions` controller within the `greet` Engine. Let
us see how.

We will organize all the overrides, in the host application, into the directory
`app/overrides`. The overrides should be ignored by the autoloader and should be
preloaded in a `to_prepare` callback. So include the following in the
`config/application.rb`:

```rb
module Party
  class Application < Rails::Application
    # ...

    overrides = "#{Rails.root}/app/overrides"
    Rails.autoloaders.main.ignore(overrides)

    config.to_prepare do
      Dir.glob("#{overrides}/**/*_override.rb").each do |override|
        load override
      end
    end
  end
end
```

Now within the file `Party/app/overrides/models/greet/receptions_override.rb`,
we can include our modified `index` action.

```rb
Greet::ReceptionsController.class_eval do
  def index
    # Override the index action from the Engine
    render plain: 'Hello from the host application!'
  end
end
```

It is very important that the override reopens the class or module. Using the
`class` or `module` keywords would define them if they were not already in
memory, which would be incorrect because the definition lives in the engine.
Using [`class_eval`](https://apidock.com/ruby/v2_5_5/Module/class_eval) as shown
above ensures you are reopening.

This way you can override the engine classes from the host application. You can
also similarly modify Engine models.

Overall, Rails Engines are a powerful tool for building modular, reusable
components in Ruby on Rails applications, and are widely used in production to
build scalable, maintainable web applications. You can learn more about Rails
Engine in the official [docs](https://guides.rubyonrails.org/engines.html).
