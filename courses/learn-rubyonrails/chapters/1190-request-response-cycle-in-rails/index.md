In this chapter we will take a step by step look at the inner workings of a
Rails application from the point the server receives a request to sending back a
response. Knowing these details will help you a great deal in understanding the
Rails architecture and its internal workings.

## Domain name server(DNS)

Browsers don't know the address of a web server. So how does a request reach its
intended destination?

Whenever you make a request from the browser to a domain, DNS maps the domain
name to an IP address and the request is received at the server with that IP
address. This process is also known as domain name resolution or DNS resolution.

## HTTP and HTTPS

HTTP or Hyper Text Transfer Protocol is a set of pre-defined guidelines through
a browser can communicate with a server over a network.

HTTP provides a structured way for the browser to ask for web pages and data,
submit forms, handle caching, compression etc.

When you make a request, it goes through a lot of places like your network
router, your ISP or the server hosting company and any data that you are sending
or receiving over a request-response cycle could be compromised.

The solution to this problem is to encrypt the request and response. This is
where HTTPS comes in. The S in HTTPS stands for secure. The
encryption/decryption is done by using a secret key which is only known to the
browser and the server.

## Rack interface

A server's job is to parse the request, then process it accordingly and send a
meaningful response back to the browser. It is easy to configure a server for
handling basic jobs like serving static assets or a static page upon a request
but as your application grows the complexity increases. This is why we use
frameworks like Rails.

Before understanding how Rails works, we need to understand Rack because Rails
is built on top of Rack. Rack presents a unified API for the web server and
Rails to communicate. It wraps the HTTP requests and responses in a way that
unifies and distills the API for web servers, web frameworks, and software in
between (the so-called middleware) into a single method call. Rack apps are
objects that handle web requests, and return responses.

Let's create a `rack_app.rb` file in the root directory of the application and
add the following lines of code to build a simple Rack application:

```ruby
class RackApp
  def call(env)
    [200, {'Content-Type' => 'text/plain'}, ["Welcome to Rails."]]
  end
end
```

Let's try to understand what's happening in the above codeblock. Every Rack
application implements a `call` method which receives a req hash called `env`.
The request env should not be confused with the `ENV` constant. The request env
represents a HTTP request and it contains all the information pertaining a
request such as the HTTP method, hostname, content-type and so on.

Whereas the ENV constant is a global built in to Ruby, and contains all the
environment variables for the current process.

The `call` method returns a response which is an array consisting of three
elements. These three elements are the status code, a hash of HTTP headers and a
body of the response which can be any object that responds to an `each` method
call.

If we have to modify the above example to render a different response for a
request on `/tasks` URL then we can do it like this:

```ruby
class RackApp
  def call(env)
    if env["PATH_INFO"] == '/tasks'
      [200, {'Content-Type' => 'text/plain'}, ["Task list"]]
    else
      [200, {'Content-Type' => 'text/plain'}, ["Welcome to Rails."]]
    end
  end
end
```

Let's breakdown what's happening in the above code. If the request is on
`/tasks` route then the call method's response will be `Task list` else it will
be `Welcome to Rails`. In a nutshell, this is what a Rails application does. It
receives a request then processes the request and returns a response.

To use the `RackApp` application for processing requests and sending back
responses, fully replace the content of `config.ru` file like this:

```ruby
require_relative "rack_app"

run RackApp.new
```

We will learn about the `config.ru` file and its significance in the next
section.

Our application is now ready to receive requests and serve responses. Let's fire
up the server. Note that we are not loading a Rails application class here hence
we cannot use the `bundle exec rails server` command to start the server.

Lucky for us, the `rack` gem comes with an example web server called `rackup`
that we can use. `rackup` understands a config file format called config.ru

Run the following command from within the directory of `config.ru` file to start
the server:

```bash
rackup
```

`rackup` will read from the `config.ru` file and start the server on PORT 9292
by default. You can test the server by vising http://localhost:9292.

When a request arrives, a new instance of the `RackApp` class will be created.
Then the `run` method will invoke the `call` method on `Rackup.new` with the
`env` hash and a relevant response will be returned.

## Entrypoint of a Rack application

The entry point for a request in a Rack application is the `config.ru` file. The
`config.ru` file in the Granite application is shown below:

```ruby
require_relative "config/environment"

run Rails.application
```

When a new request is received, the `config.ru` file is loaded. First line loads
the `config/environment.rb` file where the application's class is loaded and
initialized using `Rails.application.initialize!`. Application class is defined
in the `config/application.rb` file.

`Rails.application` is the primary Rack application object of a Rails
application. Any Rack compliant web server should be using Rails.application
object to serve a Rails application.

Then the `run` method invokes the call method on the `Rails.application` object
which is implemented in the `Rails::Engine` class which the application class
inherits from with the `env` hash.

During the `call` method execution, a list of keys are added to the env hash and
then this modified hash is passed to the middleware stack.

## Middleware

Middlewares are objects that customize the request/response.
`Rails::Application` uses `ActionDispatch::MiddlewareStack` to combine various
internal and external middlewares to form a complete Rails Rack application.

Run the following command to inspect the middleware stack in use in your
application:

```bash
bin/rails middleware
```

Above command will produce the following output:

```bash
use Webpacker::DevServerProxy
use ActionDispatch::HostAuthorization
use Rack::Sendfile
use ActionDispatch::Static
use ActionDispatch::Executor
use ActiveSupport::Cache::Strategy::LocalCache::Middleware
use Rack::Runtime
use Rack::MethodOverride
use ActionDispatch::RequestId
use ActionDispatch::RemoteIp
use Sprockets::Rails::QuietAssets
use Rails::Rack::Logger
use ActionDispatch::ShowExceptions
use WebConsole::Middleware
use ActionDispatch::DebugExceptions
use ActionDispatch::ActionableExceptions
use ActionDispatch::Reloader
use ActionDispatch::Callbacks
use ActiveRecord::Migration::CheckPending
use ActionDispatch::Cookies
use ActionDispatch::Session::CookieStore
use ActionDispatch::Flash
use ActionDispatch::ContentSecurityPolicy::Middleware
use ActionDispatch::PermissionsPolicy::Middleware
use Rack::Head
use Rack::ConditionalGet
use Rack::ETag
use Rack::TempfileReaper
run Granite::Application.routes
```

The `use` method is provided by the `rack` gem and it is used to include a
middleware in the application.

As you can see there are a bunch of middlewares implemented in the Granite
application. Each of these middlewares modifies the env hash and passes it to
the next middleware in the stack.

For example, the `ActionDispatch::Cookies` middleware sets cookies for the
request then it passes the request hash to
`ActionDispatch::Session::CookieStore` which is responsible for storing the
session in cookies and so on.

The middlewares are invoked in the same order as they are listed. To read more
about each middleware please refer to the
`[official documentation](https://guides.rubyonrails.org/rails_on_rack.html#internal-middleware-stack)`
on internal middleware stack.

## Routing

The last middleware in the middleware stack is the `Granite::Application.routes`
app. This is a Rack app generated by Rails based on the `config/routes.rb` file.
It is passed to the `run` method.

Inside this Rack app, the first thing that happens is that the request env gets
converted into an `ActionDispatch::Request` object. An env hash is a generic
representation of a web request whereas an `ActionDispatch::Request` object
contains functionality that is specific to Rails.

The request object is then used to look up the right controller/action to
dispatch the request to. Next, an empty response object is created, which is an
instance of `ActionDispatch::Response`.

## Controllers

Once the correct controller and action are derived, then the controller is
invoked using the `dispatch` method which is implemented in
`ActionController::Metal` like this:

```ruby
controller_class.dispatch(action, request, response)
```

Inside the `dispatch` class method, a new instance of the controller is created
and the request is then forwarded to an instance method which is also named
`dispatch`.

You can refer to the `dispatch` class method definition in
[Rails source code](https://github.com/rails/rails/blob/984c3ef2775781d47efa9f541ce570daa2434a80/actionpack/lib/action_controller/metal.rb#L247)
to take a deeper look into how it works.

The dispatch instance method as defined inside the `ActionController::Metal`
class is shown below:

```ruby
def dispatch(name, request, response)
  set_request!(request)
  set_response!(response)
  process(name)
  request.commit_flash
  to_a
end
```

Inside the `dispatch` class method, the request and response objects are set so
that they can be accessed from any method within the controller, and then the
correct action is invoked using `process(name)`.

Before the action is invoked however, numerous other things happen such as
params are wrapped inside a hash and callbacks are invoked.

Action methods return a response using `render`. Calling render returns a
mutated response object, which is later converted into a Rack-compatible
response array inside the `dispatch` method using `to_a`, and then returned.

Before leaving the controller, a bunch of things happen such as the after_action
callbacks are run and flash messages are stored in the session. This return
value then goes back to middlewares through routing. During this phase,
middlewares can modify the status code, headers, and response body. Some of the
response modifications done by middlewares are as follows:

- The response body may be removed entirely, based on HTTP caching headers.
- The session is committed, meaning that it is serialized and stored in a
  cookie.
- Cookies are serialized, and added to the response headers.

After all the middlewares are invoked, the response is returned from the app to
the web server. There, it is serialized into a HTTP response string, and sent
back to the client.

## References

- You can refer to
  [this](https://www.cloudflare.com/en-in/learning/dns/what-is-dns/) article for
  detailed information on DNS.

- Refer to the
  [official Rails documentation](https://guides.rubyonrails.org/rails_on_rack.html)
  to learn more about Rack.

**This is an in-depth chapter hence you do not need to commit any of these
changes.**
